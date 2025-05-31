# 🤖 Git AI Helper

A smart, interactive Git command-line assistant with autocomplete, AI-powered suggestions, and helpful guidance — designed to make Git easy, even for beginners!

---

### 🧠 How the AI works

Git AI Helper includes an intelligent suggestion engine that analyzes user input and provides corrections or alternatives for mistyped Git commands.

For example:
- Input: `git cmomit`
- Suggestion: `git commit` — Record changes with a message

The AI logic is implemented via `ai_suggester.py`, which uses semantic matching and command similarity detection to make accurate recommendations.

> ⚠️ This is a lightweight, local AI logic — not a large language model like ChatGPT.

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

Open your terminal and run the following:

```bash
pip install git+https://github.com/NikanEidi/git-ai-helper.git
```

✅ After installation, run the app using:

```bash
git-ai
```

---

## ⚙️ Prerequisites

- Python 3.8 or higher
- Git installed
- Recommended shell: `bash` or `zsh`

The installer will automatically handle Python packages:

- `prompt_toolkit`
- `rich`

---

## 💻 Usage

Once installed, simply run:

```bash
git-ai
```

You’ll see an interactive prompt:

```
Git AI Helper - Type a Git command (type 'help' or 'exit')

>>> git status
```

You can type commands like `git status`, `git push`, `git commit`, and press **[Tab]** to get suggestions and completions.

Type `help` to see a full list of available commands.

---

## 🛠 Supported Commands

Git AI Helper understands and assists with all major Git operations:

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
- `git setup your_name your_email` – quick config for Git identity

---

## 🧠 AI Suggestions

Mistyped a command? No problem.

Try:

```bash
>>> git cmomit
```

And Git AI Helper will respond:

```
Did you mean: git commit?
Description: Record changes with a message
```

---

## 🤝 Contributing

Have ideas? Found bugs? Want to improve AI suggestions?

Pull requests are welcome!

1. Fork the repo  
2. Make changes  
3. Submit a PR  

---

## 👤 Author

Created with ❤️ by **Nikan Eidi**  
GitHub: [https://github.com/NikanEidi](https://github.com/NikanEidi)

---

## 📄 License

This project is licensed under the MIT License.  
See the [LICENSE](LICENSE) file for details.
