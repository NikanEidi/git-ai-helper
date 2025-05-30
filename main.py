from prompt_toolkit import PromptSession
from prompt_toolkit.completion import Completer, Completion
from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
from prompt_toolkit.formatted_text import HTML
from commands_data import GIT_COMMANDS
from rich.console import Console
import subprocess
from ai_suggester import suggest_ai
import shlex

console = Console()
session = PromptSession()

class GitCommandCompleter(Completer):
    def get_completions(self, document, complete_event):
        word = document.get_word_before_cursor().lower()
        for cmd, desc in GIT_COMMANDS.items():
            if cmd.startswith(word):
                display = f"{cmd} — {desc}"
                yield Completion(cmd, start_position=-len(word), display=display)

def print_help():
    console.print("\n[bold cyan]Git Commands Help Menu[/bold cyan]\n")
    for cmd, desc in GIT_COMMANDS.items():
        console.print(f"[green]{cmd}[/green] → {desc}")
    console.print("\n[dim]Type a Git command or use [bold]Tab[/bold] to autocomplete[/dim]\n")

def main():
    console.print("[bold green]Git AI Helper[/bold green] - Type a Git command (type 'help' or 'exit')\n")
    completer = GitCommandCompleter()

    while True:
        try:
            user_input = session.prompt(
                HTML('<ansiblue><b>>> </b></ansiblue>'),
                completer=completer,
                auto_suggest=AutoSuggestFromHistory(),
                complete_while_typing=True
            ).strip()

            if not user_input:
                continue

            tokens = shlex.split(user_input)

            if user_input.lower() == "exit":
                console.print("[bold red]Goodbye![/bold red]")
                break

            if user_input.lower() == "help":
                print_help()
                continue

            if tokens[0] == "git" and len(tokens) >= 2 and tokens[1] == "setup":
                if len(tokens) == 4:
                    name = tokens[2]
                    email = tokens[3]
                else:
                    name = input("Enter your Git user name: ")
                    email = input("Enter your Git user email: ")
                console.print(f"[bold magenta]Setting up Git config for:[/bold magenta] [green]{name}[/green] | [cyan]{email}[/cyan]")
                try:
                    subprocess.run(["git", "config", "--global", "user.name", name], check=True)
                    subprocess.run(["git", "config", "--global", "user.email", email], check=True)
                    console.print("[green]Git config successfully applied.[/green]\n")
                except Exception as e:
                    console.print(f"[red]Error applying config:[/red] {e}")
                continue

            if tokens[0] == "git" and tokens[1] == "clone" and len(tokens) == 2:
                repo_url = input("Enter the repository URL to clone: ").strip()
                if repo_url:
                    try:
                        subprocess.run(["git", "clone", repo_url], check=True)
                    except Exception as e:
                        console.print(f"[red]Error running command:[/red] {e}")
                else:
                    console.print("[red]No URL provided. Clone canceled.[/red]")
                continue

            base_cmd = ' '.join(tokens[:2]) if len(tokens) >= 2 else tokens[0]
            if base_cmd in GIT_COMMANDS:
                console.print(f"[cyan]Description:[/cyan] {GIT_COMMANDS[base_cmd]}")
                console.print("[yellow]Running command...[/yellow]\n")
                try:
                    subprocess.run(tokens, check=True)
                except Exception as e:
                    console.print(f"[red]Error running command:[/red] {e}")
            else:
                suggestion, desc = suggest_ai(user_input)
                if suggestion:
                    console.print(f" Did you mean: [green]{suggestion}[/green]?")
                    console.print(f" Description: {desc}\n")
                else:
                    console.print("[red]Unknown command. Press Tab to see suggestions.[/red]\n")

        except KeyboardInterrupt:
            console.print("\n[bold red]Exiting.[/bold red]")
            break

if __name__ == "__main__":
    main()