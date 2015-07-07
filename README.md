# Homebrew formula for [phan](https://github.com/rlerdorf/phan)

First tap the repository and the
[homebrew/php](https://github.com/Homebrew/homebrew-php) repository:
```sh
% brew tap homebrew/php
% brew tap arnested/phan
```

Install with
([php70](https://github.com/Homebrew/homebrew-php/blob/master/Formula/php70.rb)
must be linked):
```sh
% brew install php70-phan --HEAD
```

The reasons this is not in
[homebrew/php](https://github.com/Homebrew/homebrew-php) is that it is
a head-only formula (I actually made a
[pull request](https://github.com/Homebrew/homebrew-php/pull/1822)). And
the reason why it is not in
[homebrew/head-only](https://github.com/Homebrew/homebrew-head-only)
is because it depends really hard in the homebrew/php tap.
