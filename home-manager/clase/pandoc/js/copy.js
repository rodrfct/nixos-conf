window.addEventListener('load', () => {
    let codeblocks = document.querySelectorAll('div.sourceCode')

    async function copiarCode(block, button) {
        let code = block.querySelector('code')
        let text = code.innerText

        await navigator.clipboard.writeText(text)
        button.innerText = "✓"

        setTimeout(() => {
            button.innerText = "🗊"
        }, 700)
    }
    codeblocks.forEach((codeblock) => {
        if (navigator.clipboard) {
            let copiar = document.createElement('button')
            copiar.innerText = "🗊"
            codeblock.appendChild(copiar)

            copiar.addEventListener('click', async () => {
                await copiarCode(codeblock, copiar)
            })
        }
    })
})
