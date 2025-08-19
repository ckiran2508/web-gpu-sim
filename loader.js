// Hide initial spinner when page loads
window.addEventListener('load', function() {
    setTimeout(function() {
        var initialSpinner = document.querySelector('.canvas-spinner')
        if(initialSpinner) {
            initialSpinner.style.display = 'none'
        }
    }, 1000) // Give initial script time to load
})

function loadJS(){

const url = new URL(window.location.href);
const params = new URLSearchParams(url.search);
const name = params.get('name');
   var file
    if(name === null || name === undefined){
        file ='threeD/compute_shader'
    }else{
     file = name.replace('$','/')
    }
    var main = document.getElementsByClassName('main')[0]
    var canvas = document.getElementById('myCanvas')
    var scriptElement = document.getElementById('loadedScript')
    
    // Remove existing canvas and script
    if(canvas) {
        var canvasContainer = canvas.parentElement
        if(canvasContainer && canvasContainer.classList.contains('canvas-container')) {
            main.removeChild(canvasContainer)
        } else {
            main.removeChild(canvas)
        }
    }
    if(scriptElement !== null){ 
    main.removeChild(scriptElement)
    }
    
    // Create canvas container with spinner
    var canvasContainer = document.createElement('div')
    canvasContainer.className = 'canvas-container'
    
    // Create and show spinner
    var spinner = document.createElement('div')
    spinner.className = 'canvas-spinner'
    spinner.style.display = 'block'
    
    // Create new canvas
    var newCanvas = document.createElement('canvas')
    var newScriptElement = document.createElement('script')
    newScriptElement.id = 'loadedScript'
    newScriptElement.type = 'module'
    newScriptElement.src = file+'.js'
    newCanvas.id = 'myCanvas'
    newCanvas.width = 900
    newCanvas.height = 600
    newCanvas.style = {
        'margin-left': '5%',
        'margin-top' : '2%',
        'border' : '1px solid lightgray',
    }
    
    // Add canvas and spinner to container
    canvasContainer.appendChild(newCanvas)
    canvasContainer.appendChild(spinner)
    
    // Add container to main
    main.appendChild(canvasContainer)
    main.appendChild(newScriptElement)
    
    // Hide spinner when script loads
    newScriptElement.onload = function() {
        setTimeout(function() {
            spinner.style.display = 'none'
        }, 500) // Small delay to ensure smooth transition
    }
    
    // Hide spinner on error
    newScriptElement.onerror = function() {
        spinner.style.display = 'none'
    }
    
    document.getElementById("btn-group").style.display = "none";
}