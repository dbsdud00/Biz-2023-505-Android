const countSum = (nums) => {
  let count = 0;
  nums.forEach((item) => {
    if (item % 2 === 0) {
      count = count + 1;
    }
  });
  return count;
};
const nums = [2, 3, 4, 5, 6, 7, 8, 9, 10];
console.log(countSum(nums));
