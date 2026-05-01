.PHONY: git-config zsh-install

git-config:
	@set -eu; \
	if [ -z "$(GIT_USER)" ]; then \
		printf "Git user.name: "; \
		read -r git_user; \
	else \
		git_user="$(GIT_USER)"; \
	fi; \
	if [ -z "$(GIT_EMAIL)" ]; then \
		printf "Git user.email: "; \
		read -r git_email; \
	else \
		git_email="$(GIT_EMAIL)"; \
	fi; \
	if [ -z "$$git_user" ]; then \
		echo "Git user.name is required."; \
		exit 1; \
	fi; \
	if [ -z "$$git_email" ]; then \
		echo "Git user.email is required."; \
		exit 1; \
	fi; \
	git config --global user.name "$$git_user"; \
	git config --global user.email "$$git_email"; \
	git config --global credential.helper store; \
	echo "Git global config updated."; \
	echo "user.name=$$(git config --global --get user.name)"; \
	echo "user.email=$$(git config --global --get user.email)"; \
	echo "credential.helper=$$(git config --global --get credential.helper)"

zsh-install:
	@set -eu; \
	for cmd in curl git; do \
		if ! command -v "$$cmd" >/dev/null 2>&1; then \
			echo "$$cmd is required for zsh setup."; \
			exit 1; \
		fi; \
	done; \
	if [ ! -d "$$HOME/.oh-my-zsh" ]; then \
		RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; \
	else \
		echo "Oh My Zsh already installed."; \
	fi; \
	plugin_dir="$${ZSH_CUSTOM:-$$HOME/.oh-my-zsh/custom}/plugins"; \
	mkdir -p "$$plugin_dir"; \
	for plugin in \
		"zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git" \
		"zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions.git" \
		"zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search.git"; do \
		set -- $$plugin; \
		name="$$1"; \
		repo="$$2"; \
		if [ -d "$$plugin_dir/$$name/.git" ]; then \
			git -C "$$plugin_dir/$$name" pull --ff-only; \
		elif [ -e "$$plugin_dir/$$name" ]; then \
			echo "$$plugin_dir/$$name already exists and is not a git checkout; skipping."; \
		else \
			git clone "$$repo" "$$plugin_dir/$$name"; \
		fi; \
	done; \
	echo "Zsh plugins are installed. Add them to $$HOME/.zshrc plugins=(...) if they are not already listed:"; \
	echo "Example: plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)"
