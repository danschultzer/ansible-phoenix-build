# Ansible Phoenix Build

This sample repo is configured for production-ready build and deploy cycle. It contains an ansible setup that will maintain docker image, build phoenix app in docker image, and do automated versioned releases on your production server.

## Commands

A set of binaries have been added to the [`bin/`](bin/) directory.

| Command                   | What it does |
| ------------------------- | ------------ |
| `bin/update-docker-image` | Builds and pushes the docker container used for building the Phoenix app. |
| `bin/build`               | Builds a release of the app. |
| `bin/prepare-deploy-docker`              | Prepare the docker container for deploy. This is only necessary for contained test of this repo. |
| `bin/deploy`              | Deploys a release of the app (to the docker image). |

## Vault pass

`.ansible/.vault_pass.txt` needs the following content for you to be able to run builds (this is obviously just for demo data):

```
ciloPBJybrzq51S7Sl3c0t6MjAAQhKn/FXJBRP3JM1YL9VSlTvcwP4GJa82ip83Q
s2uJGdPt9Edt4kqQa9PCEDz8ab2uJ3CMfuLw6BWiQmbiaDRNKZFs7P6i4/5txpcz
ppGE/IZaX4sdwM+DFyXnHfzLDRxmEmf7Jmlhcb1icqc3jbsvHQwKe0L+Sk2qyTs4
MZHca7cTI+247BrWuGqKMsxnpSHB8zuHCGqCAkwM1rSa9VQDbvSS9hH+TEg2ciXR
DWSrmiR3A3wdMsmdg/JxyOi2I4JAVp7mWkgH4clxVYlVru+nmVW9/14fv7kJnhxj
1cHUCAcGkDvbmP7ECqau9vlbhDBLCczbUDR4yY4Cw9zhJK5oJAZHIA==
```

## Run build locally

You can run the build locally by doing the following:

```bash
docker attach ansible_phoenix_build_build_server
cd build/_build/prod/rel/ansible_phoenix_build
bin/ansible_phoenix_build foreground
```

## Notes

- There's no sudo command in docker container, so the two places were sudo is used has been changed (with the sudo command preserved as comment)
- Local deploys goes to the docker container
- CI deploys goes to localhost
- Service restart disabled

## LICENSE

(The MIT License)

Copyright (c) 2017 Dan Schultzer & the Contributors Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.