# Emitter

A simple event emitter.  
Its only feature is that it allows you to differentiate between different subscriptions by the context they are set to call in. This makes it possible to subscribe the same function several times as you often want to when working with classes.

Example:
```js
// a Javascript "class"
function O (name) {
	this.name = name
}
O.prototype.onGreet = function(){
  console.log('Hi im an O by the name '+this.name)
}

var a = new O('olivia')
var b = new O('obby')

emitter.on('greet', a.onGreet, a)
emitter.on('greet', b.onGreet, b)
emitter.emit('greet') 
// => Hi im an O by the name olivia
// => Hi im an O by the name obby

emitter.off('greet', a.onGreet, a)

emitter.emit('greet') 
// => Hi im an O by the name obby
```

## Getting Started

With component

	$ component install jkroso/emitter

with the latest npm

	$ npm install jkroso/emitter

## API
  - [Emitter()](#emitter)
  - [Emitter.emit()](#emitteremittopicstringany)
  - [Emitter.on()](#emitterontopicstringfnfunctioncontextobject)
  - [Emitter.off()](#emitterofftopicstringfnfunctioncontextany)

## Emitter()

  Generate a new Emitter or mixin methods to `obj`
  
```js
var emitter = new Emitter
var emitter = Emitter({})
```

## Emitter.emit(topic:String, [...]:Any)

  Generate an event. All arguments after `topic` will be passed to
  the handlers
  
```js
emitter.emit('event', new Date)
```

## Emitter.on(topic:String, fn:Function, context:Object)

  Add a subscription under a topic name
  
```js
emitter.on('event', function(data){})
emitter.on('event') // implies emitter.on('event', emitter.onEvent)
emitter.on('event', function(){this === emitter}, emitter)
emitter.on('event', function(){this === emitter}) // the current context is the default
```

## Emitter.off([topic]:String, [fn]:Function, [context]:Any)

  Remove subscriptions
  
```js
emitter.off() // clears all topics
emitter.off('topic') // clears all handlers from the topic 'topic'
emitter.off('topic', fn) // as above but only if the handler === fn
emitter.off('topic', fn, window) // as above but only if the context is `window`
```


## License
Copyright (c) 2012 Jakeb Rosoman

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
