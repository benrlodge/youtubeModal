##A jQuery Modal plugin for youtube videos.

### Demo

[http://benrlodge.github.io/youtubeModal/](http://benrlodge.github.io/youtubeModal/)


### How to use: 

The modal is activated by a link, so set an id on that link, add the youtube id to the data-id attribute, then set the id of the link to the youtubeModal() plugin. That's all you need to get started.

Requirements:
- the youtubeModal.jquery.js file
- the youtubeModal.css file


#### Example: 

```html
<a href="#" id="video" data-id="xEhaVhta7sI">Click Me, I dare ya. I double dog dare ya.</a>
```

```javascript
	$(document).ready(function(){
		
		$('#video').youtubeModal({
			width: '80%'
		});

	})
```

#### Options:

```javascript	
		$('#video').youtubeModal({
			width: '80%',	// any size
			autoplay: true,	// true || false
			closeBtn: '.youtube-modal__close-btn', // class for the close icon image
			cover: '#coverItUp' // semi-transparent overlay
		});
```
		
		