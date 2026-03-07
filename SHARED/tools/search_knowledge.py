#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Shared Knowledge Search Tool
สำหรับค้นหาข้อมูลใน Shared Folder
"""
import os
import sys
import re
from pathlib import Path

# Fix UTF-8 output for Windows
if sys.platform == 'win32':
    import codecs
    sys.stdout = codecs.getwriter('utf-8')(sys.stdout.buffer, 'strict')
    sys.stderr = codecs.getwriter('utf-8')(sys.stderr.buffer, 'strict')

# Configuration
SHARED_ROOT = Path("D:/AI_Agent/openclaw/agents/SHARED")
IGNORE_DIRS = {'.git', '__pycache__', 'node_modules', '.openclaw'}

def search_in_file(file_path, query):
    """ค้นหาคำในไฟล์"""
    results = []
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            for i, line in enumerate(lines, 1):
                if query.lower() in line.lower():
                    # Get context (3 lines before and after)
                    start = max(0, i - 2)
                    end = min(len(lines), i + 2)
                    context = ''.join(lines[start:end])
                    results.append({
                        'file': str(file_path.relative_to(SHARED_ROOT)),
                        'line': i,
                        'content': line.strip(),
                        'context': context
                    })
    except Exception as e:
        pass
    return results

def search_knowledge(query, folder=None):
    """ค้นหาข้อมูลใน knowledge folder"""
    results = []
    
    if folder:
        search_path = SHARED_ROOT / "knowledge" / folder
    else:
        search_path = SHARED_ROOT / "knowledge"
    
    if not search_path.exists():
        return results
    
    for md_file in search_path.rglob("*.md"):
        # Skip ignored dirs
        if any(ignored in md_file.parts for ignored in IGNORE_DIRS):
            continue
        
        file_results = search_in_file(md_file, query)
        results.extend(file_results)
    
    return results

def search_memory(query):
    """ค้นหาข้อมูลใน memory folder"""
    results = []
    memory_path = SHARED_ROOT / "memory"
    
    if not memory_path.exists():
        return results
    
    for md_file in memory_path.rglob("*.md"):
        if any(ignored in md_file.parts for ignored in IGNORE_DIRS):
            continue
        
        file_results = search_in_file(md_file, query)
        results.extend(file_results)
    
    return results

def search_all(query):
    """ค้นหาทั้งหมดใน shared folder"""
    results = {
        'knowledge': search_knowledge(query),
        'memory': search_memory(query)
    }
    return results

def format_results(results):
    """จัดรูปผลการค้นหา"""
    output = []
    
    for category, items in results.items():
        if items:
            output.append(f"\n## 📁 {category.upper()}")
            output.append("-" * 40)
            
            for item in items:
                output.append(f"\n📄 `{item['file']}` (line {item['line']})")
                output.append(f"   {item['content']}")
    
    if not any(results.values()):
        output.append("\n❌ ไม่พบข้อมูลที่ค้นหา")
    
    return "\n".join(output)

# CLI Interface
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python search_knowledge.py <query>")
        print("Example: python search_knowledge.py วันหยุด")
        sys.exit(1)
    
    query = sys.argv[1]
    results = search_all(query)
    print(f"🔍 Searching for: '{query}'")
    print(format_results(results))
