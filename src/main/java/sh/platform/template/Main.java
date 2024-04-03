package sh.platform.template;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "ValidatorServlet", urlPatterns = {"/validate"})
public class Main extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Display input form
        out.println("<html><body>");
        out.println("<h2>Sudoku Input Validation</h2>");
        out.println("<form method='post'>");
        out.println("Row: <input type='number' name='row'><br>");
        out.println("Column: <input type='number' name='col'><br>");
        out.println("Number: <input type='number' name='num'><br>");
        out.println("<input type='submit' value='Validate'>");
        out.println("</form>");

        // Validate input if submitted
        String row = request.getParameter("row");
        String col = request.getParameter("col");
        String num = request.getParameter("num");

        if (row != null && col != null && num != null) {
            String validationResult = validateSudokuInput(row, col, num);
            out.println("<p>" + validationResult + "</p>");
        }

        out.println("</body></html>");
    }

    private String validateSudokuInput(String row, String col, String num) throws IOException {
        String urlString = "https://sudoku-microservice.azurewebsites.net/validate?row=" + row + "&col=" + col + "&num=" + num;
        URL url = new URL(urlString);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = in.readLine()) != null) {
            response.append(line);
        }
        in.close();

        return response.toString();
    }
}
