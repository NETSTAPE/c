import base64 as bs64

with open('in.txt', 'r') as f1:
    data = f1.read()
    data_bytes = data.encode('utf-16le')

    with open('out.txt', 'wb') as f2:
        f2.write(bs64.standard_b64encode(data_bytes))
        print(bs64.standard_b64encode(data_bytes))