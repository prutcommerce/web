import { Elm } from '../src/Main.elm';

var app = Elm.Main.init({ node: document.getElementById('root') });

app.ports.displayNotification.subscribe(function(message) {
    window.alert(message)
});

app.ports.updateSharedState.subscribe(function () {
    app.ports.updates.send("message")
})
