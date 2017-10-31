 // Construct a MaxStack, in JS
 class MaxStack {
   constructor(){
     this.store = [];
     this.maxes = [];
   }

 	push(n) {
     this.store.push(n);
     if (this.maxes.length === 0 || this.maxes[0] <= n) {
       this.maxes.push(n);
     }
 	}

 	pop() {
     const value = this.store.pop();
     if (value === this.maxes[this.maxes.length - 1]) {
       this.maxes.pop();
     }
     return value;
 	}

 	max() {
 		return this.maxes[this.maxes.length - 1];
 	}
 }

 let stack = new MaxStack();
