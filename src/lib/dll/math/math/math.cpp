
#include <cmath>

#include "../../ssz/ssz/sszdef.h"

static void* (__stdcall *sszrefnewfunc)(intptr_t);
static void (__stdcall *sszrefdeletefunc)(void*);

#include "../../ssz/ssz/typeid.h"
#include "../../ssz/ssz/arrayandref.hpp"
#include "../../ssz/ssz/pluginutil.hpp"


TUserFunc(double, Sin, double x)
{
	return std::sin(x);
}

TUserFunc(double, Cos, double x)
{
	return std::cos(x);
}

TUserFunc(double, Tan, double x)
{
	return std::tan(x);
}

TUserFunc(double, ASin, double x)
{
	return std::asin(x);
}

TUserFunc(double, ACos, double x)
{
	return std::acos(x);
}

TUserFunc(double, ATan, double x)
{
	return std::atan(x);
}

TUserFunc(double, Log, double y, double x)
{
	return std::log(x) / std::log(y);
}

TUserFunc(double, Ln, double x)
{
	return std::log(x);
}

TUserFunc(double, Exp, double x)
{
	return std::exp(x);
}

TUserFunc(double, Sqrt, double x)
{
	return std::sqrt(x);
}

TUserFunc(double, Ceil, double x)
{
	return std::ceil(x);
}

TUserFunc(double, Floor, double x)
{
	return std::floor(x);
}

TUserFunc(bool, IsFinite, double x)
{
	return _finite(x) != 0;
}

TUserFunc(bool, IsInf, double x)
{
	return _isnan(x) == 0 && _finite(x) == 0;
}

TUserFunc(bool, IsNaN, double x)
{
	return _isnan(x) != 0;
}
