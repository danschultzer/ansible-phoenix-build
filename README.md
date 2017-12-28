[![CircleCI](https://circleci.com/gh/danschultzer/ansible-phoenix-build.svg?style=svg)](https://circleci.com/gh/danschultzer/ansible-phoenix-build) [Blog post](https://dreamconception.com/tech/phoenix-automated-build-and-deploy-made-simple/)

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

Note that you'll need a database server to connect to. The fastest way if you're using postgres is to just run `sh bin/prepare-deploy-docker` to prepare the docker container with a postgres server and database.

## Deploy to remote server

I recommend you to follow the [blog post guide](https://dreamconception.com/tech/phoenix-automated-build-and-deploy-made-simple/) but you will be able to use this repo to deploy to a remote server.

1. Search and replace `example.com` with your actual host name (both file name, and in files)
2. Set up a `deploy` user on your remote host
3. Create `/u/apps/ansible_phoenix_build/releases`
4. Permit `deploy` user to run `sudo /bin/systemctl restart ansible_phoenix_build`.
5. Add the following systemd configuration to `/etc/systemd/system/ansible_phoenix_build.service`:
   ```ini
   [Unit]
   Description=Server for ansible_phoenix_build
   Wants=postgres.service
   After=postgres.service
   After=syslog.target
   After=network.target

   [Service]
   Type=simple
   User=deploy
   Group=deploy
   WorkingDirectory=/u/apps/ansible_phoenix_build/current
   ExecStart=/u/apps/ansible_phoenix_build/current/bin/ansible_phoenix_build foreground
   KillMode=process
   Restart=on-failure
   SuccessExitStatus=143
   TimeoutSec=10
   RestartSec=5
   SyslogIdentifier=ansible_phoenix_build

   [Install]
   WantedBy=multi-user.target
   ```

You'll be able to deploy to your remote server now!

## Notes

- Local deploys goes to the docker container
- CI deploys goes to localhost

## LICENSE

(The MIT License)

Copyright (c) 2017 Dan Schultzer & the Contributors Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.