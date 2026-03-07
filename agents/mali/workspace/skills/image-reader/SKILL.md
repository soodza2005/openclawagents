# Image Reader Skill

## Description
อ่านไฟล์รูปภาพจาก path ที่ให้มา เพื่อดูเนื้อหาในรูป

## Usage
ใช้ tool `read` อ่านไฟล์รูปโดยตรง:

```
{"file_path": "C:\\path\\to\\image.jpg"}
```

## Example
เมื่อ user ส่งรูปภาพมา สามารถอ่านได้โดย:
- ใช้ `read` tool กับ file_path ที่รูปอยู่
- Path รูปจะอยู่ในรูปแบบ: `C:\Users\thanadol.p\.openclaw\media\inbound\file_XX---xxx.jpg`

## Note
- รองรับ .jpg, .jpeg, .png, .gif, .webp
- ใช้ `read` tool (ไม่ใช่ web_fetch หรือ browser)
