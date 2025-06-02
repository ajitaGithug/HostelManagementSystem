<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check In/Out - Kolej Kerawang</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-purple: #6a3093;
            --secondary-purple: #9b59b6;
            --light-purple: #e8d6ff;
            --dark-purple: #4b2d73;
            --white: #ffffff;
            --light-gray: #f5f5f5;
            --text-dark: #333333;
            --text-medium: #555555;
            --status-green: #4CAF50;
            --status-red: #F44336;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--light-gray);
            height: 100vh;
            overflow: hidden;
        }

        .container {
            display: grid;
            grid-template-columns: 250px 1fr;
            height: 100vh;
        }

        .sidebar {
            background: linear-gradient(180deg, var(--primary-purple), var(--dark-purple));
            color: var(--white);
            padding: 30px 20px;
            overflow-y: auto;
        }

        .sidebar-header h1 {
            margin: 0;
            font-size: 24px;
            text-align: center;
            margin-bottom: 30px;
            white-space: nowrap;
            padding: 0 10px;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
        }

        .sidebar-menu a {
            display: block;
            color: var(--white);
            text-decoration: none;
            padding: 12px 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            font-weight: 500;
            white-space: nowrap;
        }

        .sidebar-menu a:hover {
            background-color: rgba(255, 255, 255, 0.15);
            transform: translateX(5px);
        }

        .main-content {
            padding: 20px;
            overflow-y: auto;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .header {
            margin-bottom: 20px;
        }

        .header h2 {
            color: var(--primary-purple);
            font-size: 28px;
            margin: 0;
            text-align: center;
        }

        .options-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .option-card {
            background-color: var(--white);
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 200px;
        }

        .option-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        .option-icon {
            font-size: 48px;
            margin-bottom: 15px;
            color: var(--primary-purple);
        }

        .option-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 10px;
        }

        .option-description {
            font-size: 14px;
            color: var(--text-medium);
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: var(--white);
            padding: 25px;
            border-radius: 10px;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 600;
            color: var(--primary-purple);
            margin: 0;
        }

        .close-modal {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: var(--text-medium);
        }

        #video {
            width: 100%;
            background: #333;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .modal-actions {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .btn-primary {
            background-color: var(--primary-purple);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--dark-purple);
        }

        .btn-secondary {
            background-color: var(--light-gray);
            color: var(--text-dark);
        }

        .btn-secondary:hover {
            background-color: #e0e0e0;
        }

        #result {
            margin-top: 15px;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            display: none;
        }

        .success {
            background-color: rgba(76, 175, 80, 0.2);
            color: var(--status-green);
        }

        .error {
            background-color: rgba(244, 67, 54, 0.2);
            color: var(--status-red);
        }
        
        #qrVideo {
            width: 100%;
            max-height: 300px;
            background: #333;
            border-radius: 8px;
            object-fit: cover;
        }

        #qrResult.result {
            margin-top: 15px;
            padding: 12px;
            border-radius: 8px;
            font-size: 14px;
            color: var(--text-dark);
            background-color: var(--light-gray);
            text-align: center;
        }

        #qrResult.success {
            background-color: rgba(76, 175, 80, 0.1);
            color: var(--status-green);
        }

        #qrResult.error {
            background-color: rgba(244, 67, 54, 0.1);
            color: var(--status-red);
        }

    </style>
</head>
<body>
<div class="container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h1>STAFF</h1>
        </div>
        <ul class="sidebar-menu">
            <li><a href="dashboard.jsp">DASHBOARD</a></li>
            <li><a href="profile.jsp">PROFILE</a></li>
            <li><a href="manage-room.jsp">MANAGE ROOM</a></li>
            <li><a href="booking.jsp">BOOKING</a></li>
            <li><a href="manage-student.jsp">MANAGE STUDENT</a></li>
            <li><a href="checkinout.jsp" class="active">CHECK IN/OUT</a></li>
            <li><a href="maintenance.jsp">MAINTENANCE</a></li>
            <li><a href="logout.jsp">SIGN-OUT</a></li>
            <li><a href="info.jsp">INFO</a></li>
            
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h2>CHECK IN/OUT</h2>
        </div>
        
        <div class="options-container">
            <div class="option-card" onclick="window.location.href='checkin.jsp';">
                <div class="option-icon">
                    <i class="fas fa-sign-in-alt"></i>
                </div>
                <div class="option-title">CHECK IN</div>
                <div class="option-description">Manually check in a student</div>
            </div>
            
            <div class="option-card" onclick="window.location.href='checkout.jsp';">
                <div class="option-icon">
                    <i class="fas fa-sign-out-alt"></i>
                </div>
                <div class="option-title">CHECK OUT</div>
                <div class="option-description">Manually check out a student</div>
            </div>
            
            <div class="option-card" onclick="openQRScanner();">
                <div class="option-icon">
                    <i class="fas fa-qrcode"></i>
                </div>
                <div class="option-title">SCAN QR CODE</div>
                <div class="option-description">Scan student's QR code for check in/out</div>
            </div>
        </div>
    </div>
</div>

<!-- QR Scanner Modal -->
<div id="qrScannerModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">QR Code Scanner</h3>
            <button class="close-modal" onclick="closeQRScanner()">&times;</button>
        </div>

        <div style="display: flex; justify-content: center; margin-bottom: 15px;">
            <video id="qrVideo" playsinline></video>
        </div>

        <div id="qrResult" class="result" style="display: none;"></div>

        <div class="modal-actions">
            <button class="btn btn-primary" onclick="startQRScanner()">Start Scanner</button>
            <button class="btn btn-secondary" onclick="closeQRScanner()">Close</button>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/jsqr@1.4.0/dist/jsQR.min.js"></script>
<script>
    // QR Scanner variables
    let qrScannerActive = false;
    let qrVideo = document.getElementById('qrVideo');
    let qrCanvas = document.createElement('canvas');
    let qrContext = qrCanvas.getContext('2d');
    let qrResult = document.getElementById('qrResult');
    
    // Open QR Scanner Modal
    function openQRScanner() {
        document.getElementById('qrScannerModal').style.display = 'flex';
    }
    
    // Close QR Scanner Modal
    function closeQRScanner() {
        stopQRScanner();
        document.getElementById('qrScannerModal').style.display = 'none';
        qrResult.style.display = 'none';
        qrResult.className = 'result';
        qrResult.innerHTML = '';
    }
    
    // Start QR Scanner
    function startQRScanner() {
        if (qrScannerActive) return;
        
        navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } })
            .then(function(stream) {
                qrVideo.srcObject = stream;
                qrVideo.setAttribute("playsinline", true); // required for iOS
                qrVideo.play();
                qrScannerActive = true;
                requestAnimationFrame(scanQRCode);
            })
            .catch(function(err) {
                console.error("Error accessing camera: ", err);
                qrResult.style.display = 'block';
                qrResult.className = 'result error';
                qrResult.innerHTML = 'Error accessing camera. Please ensure you have granted camera permissions.';
            });
    }
    
    // Stop QR Scanner
    function stopQRScanner() {
        if (!qrScannerActive) return;
        
        if (qrVideo.srcObject) {
            qrVideo.srcObject.getTracks().forEach(track => track.stop());
        }
        qrScannerActive = false;
    }
    
    // Scan for QR Codes
    function scanQRCode() {
        if (!qrScannerActive) return;
        
        if (qrVideo.readyState === qrVideo.HAVE_ENOUGH_DATA) {
            qrCanvas.height = qrVideo.videoHeight;
            qrCanvas.width = qrVideo.videoWidth;
            qrContext.drawImage(qrVideo, 0, 0, qrCanvas.width, qrCanvas.height);
            
            const imageData = qrContext.getImageData(0, 0, qrCanvas.width, qrCanvas.height);
            const code = jsQR(imageData.data, imageData.width, imageData.height, {
                inversionAttempts: "dontInvert",
            });
            
            if (code) {
                processQRCode(code.data);
            } else {
                requestAnimationFrame(scanQRCode);
            }
        } else {
            requestAnimationFrame(scanQRCode);
        }
    }
    
    // Process the scanned QR code
    function processQRCode(codeData) {
        stopQRScanner();
        
        // Here you would typically send the codeData to your backend for processing
        // For demonstration, we'll just show the result
        
        qrResult.style.display = 'block';
        qrResult.className = 'result success';
        qrResult.innerHTML = `QR Code detected: ${codeData}<br><br>Processing check-in...`;
        
        // In a real implementation, you would:
        // 1. Send the codeData to your backend via AJAX
        // 2. Handle the response (success/failure)
        // 3. Update the UI accordingly
        
        // Simulate backend processing
        setTimeout(() => {
            // This would come from your backend response
            const success = true; // or false if there was an error
            const action = codeData.includes('checkin') ? 'Check-in' : 'Check-out';
            
            if (success) {
                qrResult.innerHTML = `${action} successful for student ID: ${codeData.split('=')[1]}`;
            } else {
                qrResult.className = 'result error';
                qrResult.innerHTML = `${action} failed. Student not found or already ${action.toLowerCase()}.`;
            }
            
            // Optionally close the modal after a delay
            // setTimeout(closeQRScanner, 3000);
        }, 1500);
    }
</script>
</body>
</html>