window.addEventListener('message', function(event) {
    if (event.data.action === 'showNotify') {
        const notification = document.createElement('div');
        notification.classList.add('notification', event.data.type, event.data.position);
        
        const icon = document.createElement('i');
        icon.className = `fa ${event.data.icon}`;
        icon.style.color = event.data.iconColor;
        
        const textContainer = document.createElement('div');
        textContainer.classList.add('text-container');
        
        const title = document.createElement('span');
        title.classList.add('title');
        title.textContent = event.data.title || '';  
        
        const description = document.createElement('span');
        description.classList.add('description');
        description.textContent = event.data.description || '';  
        
        textContainer.appendChild(title);
        textContainer.appendChild(description);
        
        const progressBar = document.createElement('div');
        progressBar.className = 'progress';
        progressBar.style.animationDuration = `${event.data.duration / 1000}s`;
        
        notification.appendChild(icon);
        notification.appendChild(textContainer);
        notification.appendChild(progressBar);
        
        document.getElementById('notifications').appendChild(notification);
        
        setTimeout(() => {
            notification.style.animation = 'fadeOut 0.5s forwards';
            setTimeout(() => { notification.remove(); }, 500);
        }, event.data.duration);
    }
});
