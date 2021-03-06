#include <iostream>
#include <vector>
#include <tuple>
#include <regex>
#include <string>
using namespace std;
#include <boost/preprocessor/boo


#define STR(...) BOOST_


auto parse = [](string str){
    str = regex_replace (str, regex ("(.*)(\\[)"), R"($1)");
    str = regex_replace (str, regex ("(.*)(\\])"), R"($1)");
    str = regex_replace (str, regex ("(.*)(\\.)"), R"()");
    str = regex_replace (str, regex ("([a-z])([A-Z])"), R"($1_$2)");
    str = regex_replace (str, regex ("([[:digit:]]+)"), R"(_$1)");
    for (auto & c: str) c = toupper(c);str.insert (0, "_");
    return str;
};





int main() {
    
    
    
    EMPTY (
        
           template <>
           struct gpdu <#{i}>
           {#
        int count = #{i};
        };
        
    )
    
    string str = "hej kuk$<ph>(x, y) snopp";
    cout << parse (str) << endl;
    
    
    

    std::vector<double> input = {1.2, 2.3, 3.4, 4.5};

    cout << "hello world" << endl;
    return 0;
}


