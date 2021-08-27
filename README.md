# Notes for myself as I build this project

Follow [Josh's Readme](https://github.com/josh-works/futbol)

Repo lives here: https://github.com/gaelyn/futbol_2.git

## Dealing with Git personal access token

I tried to `git push origin main` and got:

```
remote: Support for password authentication was removed on August 13, 2021. Please use a personal access token instead.
remote: Please see https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/ for more information.
fatal: unable to access 'https://github.com/gaelyn/futbol_2.git/': The requested URL returned error: 403
```
To fix it, I:

1. Renamed the remote url from https... to git@github.com

```
git remote -v
=> origin https://...
git remote rm origin
git remote add origin git@github.com:gaelyn/futbol_2.git
```

## Turing CSV Exploration Lesson

[Turing's Class Method Exploration](https://backend.turing.edu/module1/lessons/class_methods)  
[Josh's Walkthrough](https://github.com/josh-works/futbol/tree/main/csv_exploration_lesson)
