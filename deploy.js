const Deployer = require('ssh-deploy-release');

const options = {
  localPath: 'build',
  host: process.env.REMOTE_HOST,
  username: process.env.REMOTE_USER,
  password: process.env.REMOTE_PASSWORD,
  deployPath: process.env.REMOTE_PATH,
  currentReleaseLink: 'current',
  archiveType: 'zip',
  tryKeyboard: true,
  onKeyboardInteractive: function (name, descr, lang, prompts, finish) {
    return finish([this.config.password]);
  }
};

const deployer = new Deployer(options);
deployer.deployRelease(() => {
  console.log('Deployed!')
});
