import { createLens } from 'snapkit';

const canvas = document.createElement('canvas');
const ctx = canvas.getContext('2d');
const video = document.createElement('video');

// Set up the camera view
navigator.mediaDevices.getUserMedia({ video: true }).then((stream) => {
  video.srcObject = stream;
  video.play();
});

// Set up the time travel buttons
const timePeriods = ['Ancient Rome' , 'Medieval Europe', 'Revolutionary America', 'Future City'];
const buttons = [];

for (let i = 0; i < timePeriods.length; i++) {
  buttons[i] = document.createElement('button');
  buttons[i].innerHTML = timePeriods[i];
  document.body.appendChild(buttons[i]);
}

// Set up the time travel functionality
buttons.forEach((button, index) => {
  button.addEventListener('click', () => {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.drawImage(video, 0, 0, canvas.width, canvas.height);

    // Add the appropriate background elements for the selected time period
    if (index === 0) {
      // Ancient Rome
      ctx.drawImage('https://graylinerome.com/files/4215/3719/7894/colosseum-interior.jpg', 0, 0, canvas.width, canvas.height);
    } else if (index === 1) {
      // Medieval Europe
      ctx.drawImage('https://www.celebritycruises.com/blog/content/uploads/2020/09/medieval-castles-in-europe-dublin-castle-ireland.jpg', 0, 0, canvas.width, canvas.height);
    } else if (index === 2) {
      // Revolutionary America
      ctx.drawImage('https://static1.srcdn.com/wordpress/wp-content/uploads/The-Patriot.jpg?q=50&fit=contain&w=1140&h=&dpr=1.5', 0, 0, canvas.width, canvas.height);
    } else if (index === 3) {
      // Future City
      ctx.drawImage('https://static.cdprojektred.com/cms.cdprojektred.com/16x9_big/872822c5e50dc71f345416098d29fc3ae5cd26c1-1280x720.jpg', 0, 0, canvas.width, canvas.height);
    }
  });
});

// Create the snap lens
createLens({
  canvas,
  render() {
    ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
  },
});
