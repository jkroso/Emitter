# Emitter

A simple but optimized event emitter.

## Features

- __inherited subscriptions:__
This allows you to define subscriptions on the class rather than on each instance of a class which is both more efficient in terms of memery and sometimes cleaner too.

## Installation

`npm install @jkroso/emitter`

```javascript
import Emitter from 'emitter'
```

## API

### Emitter([obj])

  Emitter constructor. Can optionally also act as a mixin

### Emitter#emit(topic, [...args])

  Process `event`. All arguments after `topic` will
  be passed to all listeners

```js
emitter.emit('event', new Date)
```

### Emitter#on(topic, fn)

  Add a subscription under a topic name

```js
emitter.on('event', function(data){})
```

### Emitter#off([topic], [fn])

  Remove subscriptions

```js
emitter.off()            // clears all listeners
emitter.off('topic')     // clears all `topic` listeners
emitter.off('topic', fn) // as above but only where `listener == fn`
```

### Emitter#once(topic, fn)

  subscribe `fn` but remove if after its first invocation

### Emitter.hasSubscription(emitter, topic, [fn])

  see if `emitter` has any subscriptions matching
  `topic` and optionally also `fn`

### Emitter.subscriptions(emitter, topic)

  get an Array of subscriptions for `topic`
