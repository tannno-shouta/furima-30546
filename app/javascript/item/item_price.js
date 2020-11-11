window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  console.log(priceInput)
  priceInput.addEventListener("input", () => {
    const InputValue = document.getElementById("item-price").value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(InputValue * 0.1);

    const Profit = document.getElementById("profit");
    Profit.innerHTML = Math.floor(InputValue * 0.9);
    
  })
})




  