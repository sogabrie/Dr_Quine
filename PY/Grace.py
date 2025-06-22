def Str():
    return """def Str():
    return {q}{q}{q}{s}{q}{q}{q}

def Print(fi, s):
    fi.write(s.format(q = chr(34), s = s))

def Main():
    if __name__ == '__main__':
        with open('Grace_kid.py', 'w') as fi:
            Print(fi, Str())

# This program will print its own source when run.

Main()"""

def Print(fi, s):
    fi.write(s.format(q = chr(34), s = s))

def Main():
    if __name__ == '__main__':
        with open('Grace_kid.py', 'w') as fi:
            Print(fi, Str())

# This program will print its own source when run.

Main()