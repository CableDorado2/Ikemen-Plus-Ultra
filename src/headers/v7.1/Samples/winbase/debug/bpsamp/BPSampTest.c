#include <windows.h>
#include <stdio.h>


char szBuff[10];



void f3(DWORD dw1, DWORD dw2)
{
	strncpy_s(szBuff, sizeof(szBuff), "hi there", _TRUNCATE);
//	for (i=0; i<10; i++)
//		szBuff[i] = 'z';

	printf("%p %s\n", szBuff, szBuff);

   MessageBox(NULL, "TEST", "TEST", MB_OK);

}

void f2(DWORD dw1, DWORD dw2)
{

	f3(2, 3);

}

void f1(DWORD dw1, DWORD dw2)
{

	f2(5, 4);

}

void main(void)
{
	CONTEXT context;
	printf("%p\n", szBuff);
	_asm int 3

	MessageBox(NULL, "attach debugger", "test", MB_OK);

	context.ContextFlags = CONTEXT_FULL | CONTEXT_DEBUG_REGISTERS;



	if (!GetThreadContext(GetCurrentThread(), &context))
		printf("GetThreadContext failed: %d\n", GetLastError());
	else
		printf("Dr0 = %08X, Dr7 = %08X\n", context.Dr0, context.Dr7);

	f1(1, 2);


}

