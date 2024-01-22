using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.IO.Log;
using System.Diagnostics;


// This sample demonstrates the basic usage of the IO.Log APIs to record data and
// clean up the logged records. This sample logs the system's CPU utilization
// every 200 ms and after a small interval writes the running avarage in a restart area.
// It moves the base of the log on subsequent writing of restart area and toggles this operation. 

// The optional use of the LogRecordSequence requires the Common Log File System (CLFS).
// This is included with Windows Server 2003 R2, Windows Vista and Windows Server "Longhorn".

namespace Microsoft.Samples.IOLog.LoggingBasics
{
    class LoggingBasics
    {
        // Set the following boolean to:
        //     true to use FileRecordSequence or
        //     false to use LogRecordSequence
        static bool usingFileLog = true;

        // Declare a sequence and the path/filename for storing the log
        static IRecordSequence sequence;
        static String logPath = "LogTest.log";

        // Declare the names and size for the initial LogRecordSequence extents
        static String logContainer0 = "extent0";
        static String logContainer1 = "extent1";
        static int containerSize = 32 * 1024;

        static PerformanceCounter cpuCounter;

        // Declare the constats for repeating operations
        const int MaxIteration = 3;
        const int NumLogAppends = 5;

        static void Main()
        {
            Setup();
            AppendRecords();
            ReadRecords();
            ReadRestartArea();

            Console.WriteLine("Press <ENTER> to clean up and terminate");
            Console.ReadLine();
            
            Cleanup();
        }

        // Demonstrates how to create a sequence
        static void Setup()
        {
            if (usingFileLog)
            {   // Setup a FileRecordSequence
                sequence = (IRecordSequence)new FileRecordSequence(logPath);
                Console.WriteLine("Successfully created FileRecordSequence");
            }
            else
            {   // Setup a LogRecordSequence
                LogRecordSequence lrs = new LogRecordSequence(logPath,
                                                              FileMode.CreateNew,
                                                              FileAccess.ReadWrite,
                                                              FileShare.None);

                // Add two extents to the log record sequence
                // Some LogRecordSequence operations require more than one sequence
                lrs.LogStore.Extents.Add(logContainer0, containerSize);
                lrs.LogStore.Extents.Add(logContainer1);
                sequence = lrs;
                Console.WriteLine("Successfully created LogRecordSequence");
            }

            // Create a total percentage processor time performance counter
            cpuCounter = new PerformanceCounter("Processor", "% Processor Time", "_Total");
            cpuCounter.NextValue();
        }


        // Demonstrates how to append log records and write restart area. 
        // Queries the CPU utilization performance counter every 200 milliseconds and records it in the log.
        // After NumLogAppends appends, it writes a restart area with the average CPU utilization. 
        // The base of the log is moved in alternate writes of restart area. 

        static void AppendRecords()
        {
            int iterations = MaxIteration * NumLogAppends;
            int data = 0;
            int sum = 0;
            int recordCount = 0;
            bool fAdvanceBase = false;

            printLogSequenceNumber();

            Console.WriteLine("Starting logging...\n");

            SequenceNumber previousRestartSeqNumber = SequenceNumber.Invalid;
            SequenceNumber previous = SequenceNumber.Invalid;

            try
            {
                while (iterations-- > 0)
                {
                    // Sleep to encourage processor utilization variability
                    System.Threading.Thread.Sleep(200);

                    // Retrieve the current processor utilization and append it to the sequence
                    data = (int)cpuCounter.NextValue();
                    Console.Write("  Processor utilization: {0}%", data);
                    previous = sequence.Append(CreateData(data), previous, previous, RecordAppendOptions.ForceFlush);
                    Console.WriteLine("  Appended record with SequenceNumber {0}", SequenceNumberToString(previous));

                    // Increment the record count and update the sum
                    recordCount++;
                    sum = sum + data;

                    
                    if (recordCount % NumLogAppends == 0)
                    {
                        // Flush to ensure that all appended records are durably written
                        sequence.Flush();

                        // Calculate the average processor utilization
                        int average = sum / recordCount;
                        Console.WriteLine("  Average processor utilization: {0}%\n", average);

                        if (fAdvanceBase)
                        {
                            Console.WriteLine("  Writing a Restart Area and advancing the base sequence number to {0}",
                                                    SequenceNumberToString(previousRestartSeqNumber));
                            previousRestartSeqNumber =
                                sequence.WriteRestartArea(CreateData(average), previousRestartSeqNumber);
                            Console.WriteLine("  Restart Area Sequence Number: {0}",
                                                    SequenceNumberToString(previousRestartSeqNumber));
                            fAdvanceBase = false;
                            Console.WriteLine("  The base of the log has been moved to the new sequence number");
                        }
                        else
                        {
                            Console.WriteLine("  Writing a Restart Area");
                            previousRestartSeqNumber = sequence.WriteRestartArea(CreateData(average));
                            Console.WriteLine("  Restart Area Sequence Number: {0}",
                                                    SequenceNumberToString(previousRestartSeqNumber));
                            fAdvanceBase = true;
                        }
                        printLogSequenceNumber();
                    }
                }

                Console.WriteLine("Logging complete\n");
            }
            catch (SequenceFullException)
            {
                Console.WriteLine("The Log is Full!");
                throw;
            }
        }


        // Read all the active records in the log...
        static void ReadRecords()
        {
            Console.WriteLine("Reading the log records...\n");
            try
            {
                // Read the records from the BaseSequenceNumber in sequential order 
                foreach (LogRecord record in
                    sequence.ReadLogRecords(sequence.BaseSequenceNumber, LogRecordEnumeratorType.Next))
                {
                    byte[] data = new byte[record.Data.Length];
                    record.Data.Read(data, 0, (int)record.Data.Length);
                    Console.WriteLine("  SequenceNumber: {0} Data: {1} Length: {2} bytes",
                                            SequenceNumberToString(record.SequenceNumber),
                                            BitConverter.ToInt32(data, 0),
                                            record.Data.Length);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception {0} {1}", e.GetType(), e.Message);
            }

            Console.WriteLine();
        }


        // Read the restart areas in the log
        // Restart areas are enumerated in reverse sequence number order
        static void ReadRestartArea()
        {
            Console.WriteLine("Reading the restart areas...\n");
            try
            {
                foreach (LogRecord record in sequence.ReadRestartAreas())
                {
                    byte[] data = new byte[record.Data.Length];
                    record.Data.Read(data, 0, (int)record.Data.Length);
                    Console.WriteLine("  SequenceNumber: {0} Data: {1} Length: {2} bytes",
                        SequenceNumberToString(record.SequenceNumber), BitConverter.ToInt32(data, 0), record.Data.Length);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception {0} {1}", e.GetType(), e.Message);
            }

            Console.WriteLine();
        }


        static void printLogSequenceNumber()
        {
            Console.WriteLine("  Base Sequence Number: {0}", SequenceNumberToString(sequence.BaseSequenceNumber));
            Console.WriteLine("  Last Sequence Number: {0}\n", SequenceNumberToString(sequence.LastSequenceNumber));
            return;
        }


        // Converts the given integer data value to an Array of ArraySegment<byte> 
        static IList<ArraySegment<byte>> CreateData(int data)
        {
            byte[] array = BitConverter.GetBytes(data);

            ArraySegment<byte>[] segments = new ArraySegment<byte>[1];
            segments[0] = new ArraySegment<byte>(array);

            return Array.AsReadOnly<ArraySegment<byte>>(segments);
        }


        // Helper routine to convert the sequence number to a string representation.
        public static string SequenceNumberToString(SequenceNumber sqn)
        {
            byte[] bytes = sqn.GetBytes();
            long realLsnHigh = BitConverter.ToInt64(bytes, 0);

            if (bytes.Length == 8)
            {
                return realLsnHigh.ToString();
            }
            else
            {
                long realLsnLow = BitConverter.ToInt64(bytes, 8);
                return realLsnLow.ToString() + "-" + realLsnHigh.ToString();
            }
        }


        // Demonstrates how to cleanup the log for FileRecordSequence and LogRecordSequence
        // Dispose the record sequence and cleanup the physical log
        static void Cleanup()
        {
            if (sequence != null)
                sequence.Dispose();

            try
            {
                if (usingFileLog)
                {
                    // Delete the the log file
                    File.Delete(logPath);
                }
                else
                {
                    // Delete the the base log file and all the associated extents
                    LogStore.Delete(logPath);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception {0} {1}", e.GetType(), e.Message);
            }
        }
    }
}
