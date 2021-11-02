function findOutlier(integers){
  //your code here
  let isEven, result, oldVal, val;
  for(let i = 0; i < integers.length(); i++){
    if(i === 0){ // for first iteration
      oldVal = i;
      // return;
    }
    if(i % 2 === 0 && oldVal % 2 === 0){
      } else if(i%2!=0 && oldVal%2!=0){
        isEven = false
      } else {
      if(i === 3 && i % 2 === 0){
        isEven = true
      } else if(i === 3 && i % 2 != 0) {
        isEven = false;
      //TODO return the number that's opposite to isEven.
      }
      oldVal = i;
      }

    }
  }
