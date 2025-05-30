from rapidfuzz import process
from commands_data import GIT_COMMANDS

def suggest_ai(user_input, limit=1):
    commands = list(GIT_COMMANDS.keys())
    matches = process.extract(user_input, commands, limit=limit, score_cutoff=60)
    if matches:
        best_match, score, _ = matches[0]
        return best_match, GIT_COMMANDS[best_match]
    return None, None