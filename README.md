# Dotfiles

## Installation

1. [Install Homebrew](https://brew.sh/)
2. Run [Brew Bundle](https://github.com/Homebrew/homebrew-bundle) from root of repository:

   ```sh
   $ brew bundle
   ```

3. Run [Stow] from `/home` directory:

   ```sh
   $ stow --target $HOME .
   ```

   to preview:

   ```sh
   stow -nSv --target $HOME .
   ```

4. Languages
   - [Node.js](https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script)
