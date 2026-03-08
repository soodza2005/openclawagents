มะลิ รัน self-improvement

```bash
git clone https://github.com/openclaw/openclaw.git
cd openclaw

pnpm install
pnpm openclaw onboard 

pnpm ui:build # auto-installs UI deps on first run
pnpm build

pnpm gateway:watch

# Dev Run
pnpm start gateway

# Dev Clean
 pnpm store prune

openclaw gateway start
openclaw gateway restart
openclaw gateway stop


openclaw sessions clear

```
