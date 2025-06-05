#include <iostream>
#include <fstream>
#include <string>


int main()
{
    std::ifstream in;
    std::string a;
    in.open("./C/Grace.c");
    if (in.is_open())
    {
        while (std::getline(in,a))
        {
            for (size_t i = 0; i < a.length(); i++)
            {
                switch (a[i])
                {
                case '\t':
                    a.replace(i,1,"%2$c");
                    break;
                case '"':
                    a.replace(i,1,"%4$c");
                    break;
                default:
                    break;
                }
            }
            
            std::cout << a << "%3$c";
        }
        
    }
    in.close();
    return 0;
}
