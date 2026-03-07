# SKILL: Inter-Agent Communication

## คำอธิบาย
Skill นี้ช่วยให้ลูน่า (pm_accounting) และไอริส (pm_hrms) สามารถส่งข้อความหากันโดยตรงได้

## วิธีใช้

### 1. ส่งข้อความถึง Agent อื่น
```python
import json
from datetime import datetime

def send_message(to_agent: str, message: str):
    """ส่งข้อความถึง agent อื่น"""
    
    # อ่าน message queue ปัจจุบัน
    with open('D:/AI_Agent/openclaw/agents/SHARED/messages/message_queue.json', 'r', encoding='utf-8') as f:
        queue = json.load(f)
    
    # เพิ่ม message ใหม่
    new_msg = {
        "from": "pm_accounting" หรือ "pm_hrms",
        "to": to_agent,
        "message": message,
        "timestamp": datetime.now().isoformat(),
        "status": "unread"
    }
    
    queue['messages'].append(new_msg)
    
    # เขียนกลับ
    with open('D:/AI_Agent/openclaw/agents/SHARED/messages/message_queue.json', 'w', encoding='utf-8') as f:
        json.dump(queue, f, ensure_ascii=False, indent=2)
    
    return f"ส่งข้อความถึง {to_agent} แล้ว"
```

### 2. อ่านข้อความที่ได้รับ
```python
def read_messages(agent_id: str):
    """อ่านข้อความที่ส่งถึงตัวเอง"""
    
    with open('D:/AI_Agent/openclaw/agents/SHARED/messages/message_queue.json', 'r', encoding='utf-8') as f:
        queue = json.load(f)
    
    # กรองเฉพาะข้อความที่ส่งถึงตัวเอง
    my_messages = [m for m in queue['messages'] if m['to'] == agent_id and m['status'] == 'unread']
    
    return my_messages
```

### 3. ส่งต่องานให้ Agent อื่น (Delegation)
```python
def delegate_task(to_agent: str, task: str, context: dict = None):
    """มอบหมายงานให้ agent อื่น"""
    
    task_message = f"""
🔄 มีงานที่ต้องการความช่วยเหลือ

📋 รายละเอียด:
{task}

📎 Context: {json.dumps(context, ensure_ascii=False) if context else 'ไม่มี'}
    """
    
    return send_message(to_agent, task_message)
```

## ตัวอย่างการใช้งาน

### ลูน่า → ไอริส
```
ส่งข้อความถึงไอริส: "พี่มะลิให้ส่งเอกสารพนักงานใหม่ให้ด้วย"
```

### ไอริส → ลูน่า
```
ส่งข้อความถึงลูน่า: "ตรวจสอบภาษีหัก ณ ที่จ่ายของพนักงานใหม่ด้วย"
```

## ข้อจำกัด
- ต้องใช้ exec เพื่อเขียน/อ่านไฟล์ JSON
- ข้อความจะถูกเก็บไว้ใน queue จนกว่าจะถูกอ่าน
- แนะนำให้ตรวจสอบ message ใหม่ๆ ทุกครั้งที่เริ่มทำงาน
