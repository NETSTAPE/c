import base64 as bs64

def EncodeString():
    print('Type string: ')
    text = input().encode('utf-16le')

    encoded_text = bs64.b64encode(text)
    print(encoded_text.decode('utf-16le'))


def EncodeFile():
    print('Type path: ')
    path = input()

    print('Type out path: ')
    out_path = input()

    with open(path, 'r') as f1:
        data = f1.read()
        data_bytes = data.encode('utf-16le')

        with open(out_path, 'wb') as f2:
            f2.write(bs64.b64encode(data_bytes))

    print('Finish!')


def DecodeString():
    print('Type string: ')
    text = input().encode('utf-16le')

    encoded_text = bs64.b64decode(text)
    print(encoded_text.decode('utf-16le'))


def DecodeFile():
    print('Type path: ')
    path = input()

    print('Type out path: ')
    out_path = input()

    with open(path, 'rb') as f1:
        data_bytes = f1.read()

        with open(out_path, 'wb') as f2:
            f2.write(bs64.b64decode(data_bytes))

    print('Finish!')


def MainMenu():
    print('Menus')
    print('1. Encode file')
    print('2. Encode string')
    print('-----------------')
    print('3. Decode file')
    print('4. Decode string')
    print('Select: ', end='')
    verbose = input()

    if verbose == '1':
        EncodeFile()
        return 0
    elif verbose == '2':
        EncodeString()
        return 0
    elif verbose == '3':
        DecodeFile()
        return 0
    elif verbose == '4':
        DecodeString()
        return 0

    if verbose != '1' and verbose != '2' and verbose != '3' and verbose != '4':
        print('Error, unknown option...')
        return 1

    return 0


MainMenu()