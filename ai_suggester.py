from rapidfuzz import process
from commands_data import GIT_COMMANDS
import os

def suggest_ai(input_command):
    commands = list(GIT_COMMANDS.keys())
    suggestion, score, _ = process.extractOne(input_command, commands)
    
    if score > 70:
        return suggestion, GIT_COMMANDS.get(suggestion, "No description available")
    return None, None