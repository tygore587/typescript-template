export default function sum(a: number, b: number) {
  return a + b;
}

function delay(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}

const app = async () => {
  await delay(10000);
  console.log("Hello world!");
};

app();
