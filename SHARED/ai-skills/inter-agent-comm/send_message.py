#!/usr/bin/env python3
"""
Inter-Agent Message Script
ช่วยให้ลูน่าและไอริสคุยกันเองได้
"""

import json
import sys
from datetime import datetime
from pathlib import Path

QUEUE_FILE = Path(__file__).parent.parent.parent / "messages" / "message_queue.json"

def load_queue():
    """โหลด message queue"""
    if QUEUE_FILE.exists():
        with open(QUEUE_FILE, 'r', encoding='utf-8') as f:
            return json.load(f)
    return {"messages": []}

def save_queue(queue):
    """บันทึก message queue"""
    with open(QUEUE_FILE, 'w', encoding='utf-8') as f:
        json.dump(queue, f, ensure_ascii=False, indent=2)

def send_message(from_agent: str, to_agent: str, message: str):
    """ส่งข้อความ"""
    queue = load_queue()
    
    new_msg = {
        "id": len(queue['messages']) + 1,
        "from": from_agent,
        "to": to_agent,
        "message": message,
        "timestamp": datetime.now().isoformat(),
        "status": "unread"
    }
    
    queue['messages'].append(new_msg)
    save_queue(queue)
    
    return f"✅ ส่งข้อความถึง {to_agent} แล้ว (ID: {new_msg['id']})"

def read_messages(agent_id: str, mark_read: bool = True):
    """อ่านข้อความที่ได้รับ"""
    queue = load_queue()
    
    # กรองข้อความที่ส่งถึงตัวเอง
    my_messages = [m for m in queue['messages'] if m['to'] == agent_id]
    
    if not my_messages:
        return f"📭 ไม่มีข้อความใหม่สำหรับ {agent_id}"
    
    # แสดงข้อความ
    result = f"📬 ข้อความสำหรับ {agent_id} ({len(my_messages)} ข้อความ):\n\n"
    
    for m in my_messages:
        result += f"🔹 จาก: {m['from']}\n"
        result += f"   เมื่อ: {m['timestamp']}\n"
        result += f"   ข้อความ: {m['message']}\n\n"
    
    # Mark as read
    if mark_read:
        for m in queue['messages']:
            if m['to'] == agent_id:
                m['status'] = 'read'
        save_queue(queue)
    
    return result

def list_agents():
    """แสดง agents ที่ available"""
    return """
🤖 Agents ในระบบ:
   - pm_accounting (ลูน่า) - งานบัญชี
   - pm_hrms (ไอริส) - งานบุคคล
"""

if __name__ == "__main__":
    import io
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
    
    if len(sys.argv) < 2:
        print("Usage:")
        print("  python send_message.py send <from> <to> <message>")
        print("  python send_message.py read <agent_id>")
        print("  python send_message.py list")
        sys.exit(1)
    
    command = sys.argv[1]
    
    if command == "send":
        if len(sys.argv) < 5:
            print("❌ กรุณาระบุ <from> <to> <message>")
            sys.exit(1)
        from_agent = sys.argv[2]
        to_agent = sys.argv[3]
        message = " ".join(sys.argv[4:])
        print(send_message(from_agent, to_agent, message))
    
    elif command == "read":
        if len(sys.argv) < 3:
            print("❌ กรุณาระบุ <agent_id>")
            sys.exit(1)
        agent_id = sys.argv[2]
        print(read_messages(agent_id))
    
    elif command == "list":
        print(list_agents())
    
    else:
        print(f"❌ ไม่รู้จักคำสั่ง: {command}")
