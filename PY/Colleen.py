# This program will print its own source when run.

def Colleen(s):
    print(s.format(q = chr(34), s = s), end='')

if __name__ == "__main__":
    #This program will print its own source when run 2.
    Colleen("""# This program will print its own source when run.

def Colleen(s):
    print(s.format(q = chr(34), s = s), end='')

if __name__ == {q}__main__{q}:
    #This program will print its own source when run 2.
    Colleen({q}{q}{q}{s}{q}{q}{q})""")