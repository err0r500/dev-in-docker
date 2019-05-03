# using Stack for a new project

### Create the project :
```
cd /src
stack new my-cool-project --resolver=lts-12.0
```

### Use the system ghc (8.4.3)
Add the line `system-ghc: true` to `~/.stack/config.yaml`


### Finish installation and check everything is fine

Run from inside your project folder :
```
stack setup
stack build
stack run
```

If everything is OK, it should display `someFunc`



