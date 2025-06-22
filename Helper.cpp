#include <iostream>
#include <fstream>
#include <string>


int main()
{
    std::ifstream in;
    std::string a;
    in.open("./PY/Grace.py");
    if (in.is_open())
    {
        while (std::getline(in,a))
        {
            for (size_t i = 0; i < a.length(); i++)
            {
                switch (a[i])
                {
                case '"':
                    a.replace(i,1,"{q}"); i += 2;
                    break;
                // case '\t':
                //     a.replace(i,1,"%2$c"); i += 3;
                //     break;
                // case '"':
                //     a.replace(i,1,"%4$c"); i += 3;
                //     break;
                // case '%':
                //     a.replace(i,1,"%%"); i += 2;
                //     break;
                default:
                    break;
                }
            }
            std::cout << a << std::endl;
        }
        
    }
    in.close();
    return 0;
}
