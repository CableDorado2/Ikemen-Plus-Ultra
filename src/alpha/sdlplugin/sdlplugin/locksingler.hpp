class LockSingler
{
	CRITICAL_SECTION mutex;
	bool locked;
public:
	LockSingler()
	{
		InitializeCriticalSection(&mutex);
		locked = false;
	}
	~LockSingler()
	{
		DeleteCriticalSection(&mutex);
	}
	bool isLocked()
	{
		return locked;
	}
	void lock()
	{
		EnterCriticalSection(&mutex);
		locked = true;
	}
	void unlock()
	{
		locked = false;
		LeaveCriticalSection(&mutex);
	}
};

class AutoLocker
{
	LockSingler * mutex;
public:
	AutoLocker(LockSingler * const m)
	{
		m->lock();
		mutex = m;
	}
	~AutoLocker()
	{
		mutex->unlock();
	}
};

class AutoUnLocker
{
	LockSingler * mutex;
public:
	AutoUnLocker(LockSingler * const m)
	{
		mutex = m;
	}
	~AutoUnLocker()
	{
		mutex->unlock();
	}
};
