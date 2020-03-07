# zsh-fzf-snippet

This zsh plugin provides manage command snippet with fzf.

## Demo

![zsh-fzf-snippet](https://user-images.githubusercontent.com/5423775/76139817-6344c180-6097-11ea-8e35-72a9b5940be7.gif "zsh-fzf-snippet")

## Installation

### Using [zplugin](https://github.com/b4b4r07/zplug)

```zsh
zinit light yuki-ycino/zsh-fzf-snippet
```

## For Example

```zsh
$ mkdir -p ~/.config/fzf-snippets
$ echo 'foo: foo command' > ~/.config/fzf-snippets/snippets
$ echo 'bar: bar command' >> ~/.config/fzf-snippets/snippets
$ echo 'foo command description' > ~/.config/fzf-snippets/foo
$ echo 'bar command description' > ~/.config/fzf-snippets/bar
```

Press Ctrl-x Ctrl-s to open fzf and select snippet.
Press ctrl-e to open the description file in the editor
