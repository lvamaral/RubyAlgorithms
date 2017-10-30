 // Construct a MaxStack, in JS
 class MaxStack {
   constructor(){
     this.store = [];
     this.maxes = [];
   }

 	push(n) {
     this.store.unshift(n);
     if (this.maxes.length === 0 || this.maxes[0] <= n) {
       this.maxes.unshift(n);
     }
 	}

 	pop() {
     const value = this.store.shift();
     if (value === this.maxes[0]) {
       this.maxes.shift();
     }
     return value;
 	}

 	max() {
 		return this.maxes[0];
 	}
 }

 let stack = new MaxStack();
