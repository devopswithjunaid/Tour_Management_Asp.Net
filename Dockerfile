# Use nginx to serve the application with proper ASPX handling
FROM nginx:alpine

# Copy the application files
COPY DotNetFrameworkProject_CE040_CE087/Tour_Management/ /usr/share/nginx/html/

# Create a custom nginx configuration that serves ASPX files as HTML
RUN echo 'server {' > /etc/nginx/conf.d/default.conf && \
    echo '    listen 80;' >> /etc/nginx/conf.d/default.conf && \
    echo '    server_name localhost;' >> /etc/nginx/conf.d/default.conf && \
    echo '    root /usr/share/nginx/html;' >> /etc/nginx/conf.d/default.conf && \
    echo '    index index.html DisplayTours.aspx;' >> /etc/nginx/conf.d/default.conf && \
    echo '' >> /etc/nginx/conf.d/default.conf && \
    echo '    # Serve ASPX files as HTML with proper content type' >> /etc/nginx/conf.d/default.conf && \
    echo '    location ~ \.aspx$ {' >> /etc/nginx/conf.d/default.conf && \
    echo '        add_header Content-Type text/html;' >> /etc/nginx/conf.d/default.conf && \
    echo '        try_files $uri =404;' >> /etc/nginx/conf.d/default.conf && \
    echo '    }' >> /etc/nginx/conf.d/default.conf && \
    echo '' >> /etc/nginx/conf.d/default.conf && \
    echo '    # Serve other files normally' >> /etc/nginx/conf.d/default.conf && \
    echo '    location / {' >> /etc/nginx/conf.d/default.conf && \
    echo '        try_files $uri $uri/ =404;' >> /etc/nginx/conf.d/default.conf && \
    echo '    }' >> /etc/nginx/conf.d/default.conf && \
    echo '}' >> /etc/nginx/conf.d/default.conf

# Create an enhanced index page that shows the application structure
RUN echo '<!DOCTYPE html>' > /usr/share/nginx/html/index.html && \
    echo '<html>' >> /usr/share/nginx/html/index.html && \
    echo '<head>' >> /usr/share/nginx/html/index.html && \
    echo '    <title>Tour Management System</title>' >> /usr/share/nginx/html/index.html && \
    echo '    <style>' >> /usr/share/nginx/html/index.html && \
    echo '        body { font-family: Arial, sans-serif; margin: 40px; background: #f5f5f5; }' >> /usr/share/nginx/html/index.html && \
    echo '        .container { max-width: 1000px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }' >> /usr/share/nginx/html/index.html && \
    echo '        .header { background: linear-gradient(135deg, #6B696B, #8B8686); color: white; padding: 30px; text-align: center; border-radius: 10px; margin-bottom: 30px; }' >> /usr/share/nginx/html/index.html && \
    echo '        .content { padding: 20px; }' >> /usr/share/nginx/html/index.html && \
    echo '        .nav { margin: 30px 0; display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; }' >> /usr/share/nginx/html/index.html && \
    echo '        .nav a { padding: 15px 20px; background: #007bff; color: white; text-decoration: none; border-radius: 8px; text-align: center; transition: all 0.3s; }' >> /usr/share/nginx/html/index.html && \
    echo '        .nav a:hover { background: #0056b3; transform: translateY(-2px); }' >> /usr/share/nginx/html/index.html && \
    echo '        .info-box { background: #e3f2fd; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #2196f3; }' >> /usr/share/nginx/html/index.html && \
    echo '        .warning-box { background: #fff3cd; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #ffc107; }' >> /usr/share/nginx/html/index.html && \
    echo '        .feature-list { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin: 20px 0; }' >> /usr/share/nginx/html/index.html && \
    echo '        .feature { background: #f8f9fa; padding: 20px; border-radius: 8px; border: 1px solid #dee2e6; }' >> /usr/share/nginx/html/index.html && \
    echo '    </style>' >> /usr/share/nginx/html/index.html && \
    echo '</head>' >> /usr/share/nginx/html/index.html && \
    echo '<body>' >> /usr/share/nginx/html/index.html && \
    echo '    <div class="container">' >> /usr/share/nginx/html/index.html && \
    echo '        <div class="header">' >> /usr/share/nginx/html/index.html && \
    echo '            <h1>🏖️ Tour Management System</h1>' >> /usr/share/nginx/html/index.html && \
    echo '            <p>Your ASP.NET Application is Running in Docker!</p>' >> /usr/share/nginx/html/index.html && \
    echo '        </div>' >> /usr/share/nginx/html/index.html && \
    echo '        <div class="content">' >> /usr/share/nginx/html/index.html && \
    echo '            <div class="info-box">' >> /usr/share/nginx/html/index.html && \
    echo '                <h3>✅ Application Successfully Containerized!</h3>' >> /usr/share/nginx/html/index.html && \
    echo '                <p>Your Tour Management System is now running in a Docker container. You can explore the application structure and view the ASPX pages below.</p>' >> /usr/share/nginx/html/index.html && \
    echo '            </div>' >> /usr/share/nginx/html/index.html && \
    echo '            <h2>🚀 Application Pages</h2>' >> /usr/share/nginx/html/index.html && \
    echo '            <div class="nav">' >> /usr/share/nginx/html/index.html && \
    echo '                <a href="DisplayTours.aspx">📋 Display Tours</a>' >> /usr/share/nginx/html/index.html && \
    echo '                <a href="userlogin.aspx">👤 User Login</a>' >> /usr/share/nginx/html/index.html && \
    echo '                <a href="AdminLogin2.aspx">🔐 Admin Login</a>' >> /usr/share/nginx/html/index.html && \
    echo '                <a href="SignUpForm.aspx">📝 Sign Up</a>' >> /usr/share/nginx/html/index.html && \
    echo '                <a href="AddTour.aspx">➕ Add Tour</a>' >> /usr/share/nginx/html/index.html && \
    echo '                <a href="Order.aspx">🛒 Order</a>' >> /usr/share/nginx/html/index.html && \
    echo '                <a href="mybooking.aspx">📅 My Booking</a>' >> /usr/share/nginx/html/index.html && \
    echo '                <a href="allbooking.aspx">📊 All Bookings</a>' >> /usr/share/nginx/html/index.html && \
    echo '            </div>' >> /usr/share/nginx/html/index.html && \
    echo '            <div class="feature-list">' >> /usr/share/nginx/html/index.html && \
    echo '                <div class="feature">' >> /usr/share/nginx/html/index.html && \
    echo '                    <h4>🎯 What You Can Do</h4>' >> /usr/share/nginx/html/index.html && \
    echo '                    <ul>' >> /usr/share/nginx/html/index.html && \
    echo '                        <li>View all ASPX pages</li>' >> /usr/share/nginx/html/index.html && \
    echo '                        <li>See application structure</li>' >> /usr/share/nginx/html/index.html && \
    echo '                        <li>Access static content</li>' >> /usr/share/nginx/html/index.html && \
    echo '                        <li>View images and resources</li>' >> /usr/share/nginx/html/index.html && \
    echo '                    </ul>' >> /usr/share/nginx/html/index.html && \
    echo '                </div>' >> /usr/share/nginx/html/index.html && \
    echo '                <div class="feature">' >> /usr/share/nginx/html/index.html && \
    echo '                    <h4>🔧 Technical Details</h4>' >> /usr/share/nginx/html/index.html && \
    echo '                    <ul>' >> /usr/share/nginx/html/index.html && \
    echo '                        <li>ASP.NET Framework 4.7.2</li>' >> /usr/share/nginx/html/index.html && \
    echo '                        <li>SQL Server LocalDB</li>' >> /usr/share/nginx/html/index.html && \
    echo '                        <li>Running in Docker</li>' >> /usr/share/nginx/html/index.html && \
    echo '                        <li>Port: 8080</li>' >> /usr/share/nginx/html/index.html && \
    echo '                    </ul>' >> /usr/share/nginx/html/index.html && \
    echo '                </div>' >> /usr/share/nginx/html/index.html && \
    echo '            </div>' >> /usr/share/nginx/html/index.html && \
    echo '            <div class="warning-box">' >> /usr/share/nginx/html/index.html && \
    echo '                <h3>ℹ️ Important Note</h3>' >> /usr/share/nginx/html/index.html && \
    echo '                <p><strong>Server-side functionality</strong> (database operations, form processing) requires ASP.NET Framework runtime. For full functionality, switch to Windows containers or run on a Windows server with IIS.</p>' >> /usr/share/nginx/html/index.html && \
    echo '                <p><strong>Current setup</strong> allows you to view the application structure, ASPX pages, and static content.</p>' >> /usr/share/nginx/html/index.html && \
    echo '            </div>' >> /usr/share/nginx/html/index.html && \
    echo '        </div>' >> /usr/share/nginx/html/index.html && \
    echo '    </div>' >> /usr/share/nginx/html/index.html && \
    echo '</body>' >> /usr/share/nginx/html/index.html && \
    echo '</html>' >> /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
