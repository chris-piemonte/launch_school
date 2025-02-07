// Go over the two HTML snippets. How many nodes will the resulting DOM tree have?

<div>
  <p>Then press the <em>Draw</em> button</p> 
</div>

// 11 => HTML, HEAD, BODY, DIV, text, P, text, text, EM, text, text

<div><p>Then press the <em>Draw</em> button.</p></div>

// 9 => HTML, HEAD, BODY, DIV, P, text, EM, text, text
