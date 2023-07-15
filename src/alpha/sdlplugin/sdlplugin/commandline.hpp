#include <string>
#include <vector>
template<typename charT> class CommandLineString
{
	std::vector<std::basic_string<charT>> cmdline;
public:
	void set(charT const *cl)
	{
		cmdline.clear();
		auto dq = false;
		for(;;){
			while(!dq && (*cl == (charT)' ' || *cl == (charT)'\t')) cl++;
			if(*cl == (charT)'"'){
				dq = !dq;
				cl++;
				continue;
			}
			if(*cl == (charT)'\0') break;
			cmdline.push_back(std::basic_string<charT>());
			for(;
				(dq || (*cl != (charT)' ' && *cl != (charT)'\t'))
				&& *cl != (charT)'\0';
				cl++)
			{
				if(*cl == (charT)'"'){
					dq = !dq;
				}else{
					cmdline.back() += *cl;
				}
			}
		}
	}
	void swap(std::vector<std::basic_string<charT>> &newValue)
	{
		cmdline.swap(newValue);
	}
	const std::vector<std::basic_string<charT>>& get() const
	{
		return cmdline;
	}
};
