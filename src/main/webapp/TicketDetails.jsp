<!DOCTYPE html>
<%@page import="java.util.Random"%>
<%@page import="DTO.User"%>
<%@page import="DAO.UserDao"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bus Ticket</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
}

.ticket {
    width: 300px;
    margin: 50px auto;
    background-color: #f8f8f8;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.ticket-header {
    text-align: center;
    margin-bottom: 20px;
}

.ticket-header h2 {
    font-size: 24px;
    margin: 0;
    padding: 0;
    color: #4CAF50; /* Green color */
}

.ticket-body {
    padding: 10px;
    border-top: 2px dashed #ccc;
    border-bottom: 2px dashed #ccc;
    margin-bottom: 20px;
}

.ticket-info {
    margin-bottom: 10px;
}

.ticket-info label {
    font-weight: bold;
    color: #555;
}

.ticket-info input {
    width: calc(100% - 20px); /* Adjusted for padding */
    padding: 5px;
    border: none;
    border-radius: 5px;
    background-color: #f8f8f8;
}

.ticket-info input[disabled] {
    background-color: #fff;
    color: #333;
}

.download-btn {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    text-align: center;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
</style>
</head>
<body>
    <%
	HttpSession httpSession = request.getSession();
	String email = (String) httpSession.getAttribute("email");
	UserDao dao = new UserDao();
	User user = dao.findByEmail(email);
	Random random = new Random();
	int no = random.nextInt(50);
	String from = (String) request.getAttribute("from");
	String to = (String) request.getAttribute("to");
	%>

    <div class="ticket" id="invoice">
        <div class="ticket-header">
            <h2>Bus Ticket</h2>
        </div>
        <div class="ticket-body">
            <div class="ticket-info">
                <label> From:</label> <input type="text" value="<%=from%>" disabled>
            </div>
            <div class="ticket-info">
                <label> To:</label> <input type="text" value="<%=to%>" disabled>
            </div>
            <div class="ticket-info">
                <label>Name:</label> <input type="text"
                    value="<%=user.getFirstName() + ' ' + user.getLastName()%>"
                    disabled>
            </div>
            <div class="ticket-info">
                <label>Phone Number:</label> <input type="text"
                    value="<%=user.getPhoneNo()%>" disabled>
            </div>
            <div class="ticket-info">
                <label>Email:</label> <input type="text" value="<%=email%>" disabled>
            </div>
            <div class="ticket-info">
                <label>Seat Number:</label> <input type="text" value="<%=no%>"
                    disabled>
            </div>

            <button class="btn btn-primary" id="downloadPdf">Generate Invoice</button>
        </div>
    </div>
    <script>
        document.getElementById('downloadPdf').addEventListener('click', function() {
            // Hide the Generate Invoice button before generating the PDF
            document.getElementById('downloadPdf').style.display = 'none';

            const invoiceElement = document.getElementById('invoice');
            const options = {
                margin: 1,
                filename: 'invoice.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };

            // Then call html2pdf with the element and options
            html2pdf().from(invoiceElement).set(options).save().then(function() {
                // After generating the PDF, restore the Generate Invoice button
                document.getElementById('downloadPdf').style.display = 'block';
            });
        });
    </script>
</body>
</html>
