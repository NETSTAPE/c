import hashlib
import os.path


def md5hashString():
    md5 = hashlib.md5()

    print('Type string: ', end='')
    text = input()

    md5.update(text.encode('UTF-8'))
    print(md5.hexdigest())


def sha1hashString():
    sha1 = hashlib.sha1()

    print('Type string: ', end='')
    text = input()

    sha1.update(text.encode('UTF-8'))
    print(sha1.hexdigest())


def sha256hashString():
    sha256 = hashlib.sha256()

    print('Type string: ', end='')
    text = input()

    sha256.update(text.encode('UTF-8'))
    print(sha256.hexdigest())


def sha384hashString():
    sha384 = hashlib.sha384()

    print('Type string: ', end='')
    text = input()

    sha384.update(text.encode('UTF-8'))
    print(sha384.hexdigest())


def md5hashFile():
    print('Type file path: ', end='')
    path = input()

    if not os.path.exists(path):
        print('File not exists')
        return 1

    hash_md5 = hashlib.md5()
    with open(path, 'rb') as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)

    print(hash_md5.hexdigest())


def sha256hashFile():
    print('Type file path: ', end='')
    path = input()

    if not os.path.exists(path):
        print('File not exists')
        return 1

    hash_sha256 = hashlib.sha256()
    with open(path, 'rb') as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_sha256.update(chunk)

    print(hash_sha256.hexdigest())


def sha1hashFile():
    print('Type file path: ', end='')
    path = input()

    if not os.path.exists(path):
        print('File not exists')
        return 1

    hash_sha1 = hashlib.sha1()
    with open(path, 'rb') as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_sha1.update(chunk)

    print(hash_sha1.hexdigest())


def sha384hashFile():
    print('Type file path: ', end='')
    path = input()

    if not os.path.exists(path):
        print('File not exists')
        return 1

    hash_sha384 = hashlib.sha384()
    with open(path, 'rb') as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_sha384.update(chunk)

    print(hash_sha384.hexdigest())


def encodeString(type):
    print('1. MD5')
    print('2. SHA1')
    print('3. SHA256')
    print('4. SHA384')
    print('Select: ', end='')
    algorithm = input()

    if type == '1':
        if algorithm == '1':
            md5hashString()
            raise SystemExit(1)
        elif algorithm == '2':
            sha1hashString()
            raise SystemExit(1)
        elif algorithm == '3':
            sha256hashString()
            raise SystemExit(1)
        elif algorithm == '4':
            sha384hashString()
            raise SystemExit(1)

    elif type == '2':
        if algorithm == '1':
            md5hashFile()
            raise SystemExit(1)
        elif algorithm == '2':
            sha1hashFile()
            raise SystemExit(1)
        elif algorithm == '3':
            sha256hashFile()
            raise SystemExit(1)
        elif algorithm == '4':
            sha384hashFile()
            raise SystemExit(1)

    print('Error, this algorithm method not exists')

    return 1


def compareHashSumm():
    print('Type first hash summ: ', end='')
    fhs = input()

    print('Type second hash summ: ', end='')
    shs = input()

    if fhs == shs:
        print('Hash summs equals')
    else:
        print('Hash summs NOT equals')

    return 0

def mainMenu():
    print('Menus')
    print('1. Calculate hash from string')
    print('2. Calculate hash from file')
    print('3. Compare two hash summs')
    print('q. Exit')
    print('Select: ', end='')
    verb = input()

    if verb == '1':
        encodeString(verb)
    elif verb == '2':
        encodeString(verb)
    elif verb == '3':
        compareHashSumm()
    elif verb.lower() == 'q':
        print('Bay!')
        return 0

    if verb != '1' and verb != '2' and verb != '3' and verb != 'q':
        print('Error, this option not exists')
        return 1

    return 0

mainMenu()
