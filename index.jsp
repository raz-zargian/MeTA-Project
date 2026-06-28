<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>DevOps Currency Converter</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f6f9; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .converter-card { background: white; padding: 35px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.08); width: 350px; text-align: center; border-top: 5px solid #0d6efd; }
        h2 { margin-top: 0; color: #212529; }
        .subtitle { color: #6c757d; font-size: 13px; margin-bottom: 25px; text-transform: uppercase; letter-spacing: 1px; }
        
        /* THE INPUT TEXT BOX */
        label { display: block; text-align: left; font-weight: 600; margin-bottom: 8px; color: #495057; }
        input[type="text"] { width: 100%; padding: 12px; margin-bottom: 20px; border: 2px solid #e9ecef; border-radius: 6px; box-sizing: border-box; font-size: 18px; transition: border-color 0.2s; }
        input[type="text"]:focus { border-color: #0d6efd; outline: none; }
        
        /* THE BUTTON */
        button { background-color: #0d6efd; color: white; border: none; padding: 14px 20px; width: 100%; border-radius: 6px; font-size: 16px; font-weight: bold; cursor: pointer; transition: background-color 0.2s; }
        button:hover { background-color: #0b5ed7; }
        
        /* RESULTS & ERRORS */
        .result { margin-top: 25px; font-size: 24px; color: #198754; font-weight: bold; padding: 20px; background: #e8f5e9; border-radius: 8px; border-left: 5px solid #198754; }
        .error { margin-top: 25px; font-size: 14px; color: #dc3545; background: #f8d7da; padding: 15px; border-radius: 8px; border-left: 5px solid #dc3545; }
        
        /* THE LINK */
        .reset-link { display: inline-block; margin-top: 25px; color: #adb5bd; text-decoration: none; font-size: 14px; transition: color 0.2s; }
        .reset-link:hover { color: #495057; text-decoration: underline; }
    </style>
</head>
<body>

<div class="converter-card">
    <h2>USD to ILS Exchange</h2>
    <div class="subtitle">Raz's Tomcat 11 Node</div>
    
    <form action="index.jsp" method="POST">
        <label for="usdAmount">Enter Amount in USD ($):</label>
        <input type="text" id="usdAmount" name="amount" placeholder="e.g., 150.50" autocomplete="off">
        
        <button type="submit">Convert to ILS (₪)</button>
    </form>

    <%-- JAVA BACKEND LOGIC --%>
    <% 
        String amountStr = request.getParameter("amount");
        
        if (amountStr != null && !amountStr.trim().isEmpty()) {
            try {
                // Convert the text input to a decimal number
                double usd = Double.parseDouble(amountStr);
                
                // Set the current exchange rate (approximate)
                double exchangeRate = 3.0; 
                double ils = usd * exchangeRate;
                
                // Format the numbers to 2 decimal places for clean currency display
                String formattedIls = String.format("%.2f", ils);
                String formattedUsd = String.format("%.2f", usd);
    %>
                <div class="result">
                    $<%= formattedUsd %> = ₪<%= formattedIls %>
                </div>
    <% 
            } catch (NumberFormatException e) { 
                // Catch the error if the user types letters instead of numbers
    %>
                <div class="error">
                    <strong>Invalid Input!</strong><br>Please enter a numeric value.
                </div>
    <% 
            }
        } 
    %>

    <a class="reset-link" href="index.jsp">🔄 Clear & Reset form</a>
</div>

</body>
</html>