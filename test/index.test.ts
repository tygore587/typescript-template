import sum from "../src";

test("1 + 2 is 3", () => {
  const result = sum(1, 2);

  expect(result).toBe(3);
});
