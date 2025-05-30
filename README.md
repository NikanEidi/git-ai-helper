# 🤖 Git AI Helper

A smart, interactive Git command-line assistant with autocomplete, AI-powered suggestions, and helpful guidance — designed to make Git easy, even for beginners!

---

### 🧠 How the AI works

Git AI Helper includes an intelligent suggestion engine that analyzes user input and provides corrections or alternatives for mistyped Git commands.

For example:
- Input: `git cmomit`
- Suggestion: `git commit` — Record changes with a message

The AI logic is implemented via `ai_suggester.py`, which uses semantic matching and command similarity detection to make accurate recommendations.

*Note: This is a lightweight AI logic designed for CLI use — not a large language model like ChatGPT.*

---

## 🚀 Features

- 🔍 Autocomplete for common Git commands  
- 🤖 AI-based suggestions for mistyped or incomplete commands  
- 📚 Helpful descriptions for every Git command  
- 🧠 Learns your Git history for smarter auto-suggestions  
- 🛠️ Easy `git setup` for name/email configuration  
- 📂 Covers all major Git operations: `push`, `pull`, `branch`, `merge`, `remote`, and more  
- 🧵 Command history persists between sessions  
- 🎯 Use it anywhere by typing `git-ai` in your terminal  

---

## 📦 Installation (1-line setup for macOS, Linux, WSL)

Open your terminal and run one of the following:

Using `curl`:

```bash
bash <(curl -s https://raw.githubusercontent.com/NikanEidi/git-ai-helper/main/install.sh)
```

Using `wget`:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/NikanEidi/git-ai-helper/main/install.sh)
```

✅ After installation, you can run the app by typing `git-ai`.

---

## ⚙️ Prerequisites

- Python 3.8+
- Git installed
- Recommended shell: `bash` or `zsh`

The installer will automatically install required Python packages:

- `prompt_toolkit`
- `rich`

---

## 💻 Usage

Once installed, simply run:

```bash
git-ai
```

You'll see an interactive prompt like this:

```
Git AI Helper - Type a Git command (type 'help' or 'exit')

>>> git status
```

You can start typing Git commands and use [Tab] for suggestions or type `help` to see all available commands.

---

## 🛠 Supported Commands

Examples of supported commands:

- `git init`
- `git clone`
- `git status`
- `git add`
- `git commit -m "message"`
- `git push`
- `git pull`
- `git branch`
- `git merge`
- `git log`
- `git diff`
- `git remote -v`
- `git rebase`
- `git stash`
- `git tag`
- `git setup your_name your_email` — quick config helper

---

## 🧠 AI Suggestions

If you type something that’s not a valid Git command, Git AI Helper will try to guess what you meant and help you fix it.

---

## 🤝 Contributing

Have ideas for features? Found a bug?  
Pull requests are welcome! Fork the repo and submit a PR.

---

## 👤 Author

Created with ❤️ by Nikan Eidi  
GitHub: [https://github.com/NikanEidi](https://github.com/NikanEidi/git-ai-helper)

---

## 📄 License

This project is licensed under the MIT License.
