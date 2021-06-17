<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	MultipartRequest multi = new MultipartRequest(request, "C:/upload",
        5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

	String tmp;
	String outFile = multi.getParameter("outFile");
	String algo = multi.getParameter("algo");
	String parameter = multi.getParameter("parameter");
	
	Enumeration files = multi.getFileNames();
	tmp = (String) files.nextElement();
	String inFile = multi.getOriginalFileName(tmp);

	// ����ó�� ���α׷� �⺻ ó��
	// lena256.raw ������ �о, ����ó�� �˰��� ���ؼ� ó������, ����� �����ϱ�..
	// (1) JSP���� ���� ó��
	int inW, inH, outW=0, outH=0;
	
	File inFp;
	FileInputStream inFs;
	inFp = new File("C:/PC_photo/" + inFile);
	long fLen=inFp.length();
	inH=inW=(int)Math.sqrt(fLen);
	
	inFs = new FileInputStream(inFp.getPath());
	// (2) JSP���� �迭 ó��
	int[][]  inImage = new int[inH][inW]; // �޸� �Ҵ�
	// ���� --> �޸�
	for (int i=0; i<inH; i++) {
		for (int k=0; k<inW; k++) {
			inImage[i][k] = inFs.read();
		}
	}
	inFs.close();
	int[][] outImage = null;
	
	switch (algo){
	case "1" : //����
		// ���� �˰��� :  out = 255 - in
		// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
		outH = inH;
		outW = inW;
		// �޸� �Ҵ�
		outImage = new int[outH][outW];
		// ��¥ ����ó�� �˰���
		for(int i=0; i<inH; i++)
			for (int k=0; k<inW; k++) {
				outImage[i][k] = 255 - inImage[i][k];
			}
		break;
	case "2" : //����ϱ�
		// (3) �˰����� �����ϱ�...
		// ���� �˰��� :  out = 255 - in
		// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
		outH = inH;
		outW = inW;
		// �޸� �Ҵ�
		outImage = new int[outH][outW];
		// ��¥ ����ó�� �˰���
		for(int i=0; i<inH; i++)
			for (int k=0; k<inW; k++) {
				int value = inImage[i][k] + Integer.parseInt(parameter);
				if (value >255)
					value=255;
				if (value <0)
					value=0;
				
				outImage[i][k] = value;
				
			}
		break;
	case "3" : //��Ӱ��ϱ�
		// (3) �˰����� �����ϱ�...
		// ���� �˰��� :  out = 255 - in
		// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
		outH = inH;
		outW = inW;
		// �޸� �Ҵ�
		outImage = new int[outH][outW];
		// ��¥ ����ó�� �˰���
		for(int i=0; i<inH; i++)
			for (int k=0; k<inW; k++) {
				int value = inImage[i][k] - Integer.parseInt(parameter);
				if (value >255)
					value=255;
				if (value <0)
					value=0;
				
				outImage[i][k] = value;
				
			}
		break;
	case "4" : //���
		// (3) �˰����� �����ϱ�...
		// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
		outH = inH;
		outW = inW;
		// �޸� �Ҵ�
		outImage = new int[outH][outW];
		// ��¥ ����ó�� �˰���
		for(int i=0; i<inH; i++)
			for (int k=0; k<inW; k++) {
				if(inImage[i][k]>127)
					outImage[i][k]=255;
				else
					outImage[i][k]=0;
		
			}
		break;
	case "5" : //Ȯ��
		// (3) �˰����� �����ϱ�...
		// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
		outH = inH*Integer.parseInt(parameter);
		outW = inW*Integer.parseInt(parameter);
		// �޸� �Ҵ�
		outImage = new int[outH][outW];
		// ��¥ ����ó�� �˰���
		for(int i=0; i<inH*Integer.parseInt(parameter); i++ ){
			for(int k=0; k<inW*Integer.parseInt(parameter); k++){
				outImage[i][k]=inImage[i/Integer.parseInt(parameter)][k/Integer.parseInt(parameter)];
				}
			}
		break;
	case "6" : //���
		// (3) �˰����� �����ϱ�...
		// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
		outH=inH/Integer.parseInt(parameter);
		outW=inW/Integer.parseInt(parameter);
		// �޸� �Ҵ�
		outImage = new int[outH][outW];
		// ��¥ ����ó�� �˰���
		for(int i=0; i<inH/Integer.parseInt(parameter); i++ ){
			for(int k=0; k<inW/Integer.parseInt(parameter); k++){
				outImage[i][k]=inImage[i*Integer.parseInt(parameter)][k*Integer.parseInt(parameter)];
				}
			}
		break;
	case "7" : //ȸ��
		// (3) �˰����� �����ϱ�...
		// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
		outH=inH;
		outW=inW;
		// �޸� �Ҵ�
		outImage = new int[outH][outW];
		// ��¥ ����ó�� �˰���
		double radian = Integer.parseInt(parameter)*Math.PI/180.0;
		radian = -radian;
		int xs, ys, xd ,yd;
		int cx=inH/2;
		int cy=inW/2;
		
		for(int i=0; i<outH; i++) {
			for(int k=0; k<outW; k++) {
				xs = i;
				ys = k;
				xd = (int)(Math.cos(radian)*(xs-cx) - Math.sin(radian)*(ys-cy)+cx);
				yd = (int)(Math.sin(radian)*(xs-cx) + Math.cos(radian)*(ys-cy)+cy);
				if((0 <= xd && xd <outH) && (0 <= yd && yd<outW))
					outImage[xs][ys] = inImage[xd][yd];
				else
					outImage[xs][ys]=255;
				
			}
		}
		break;
	case "8" : //������
		// (3) �˰����� �����ϱ�...
		// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
		outH=inH;
		outW=inW;
		// �޸� �Ҵ�
		outImage = new int[outH][outW];
		// ��¥ ����ó�� �˰���
		double[][] mask = {{-1.0, 0.0, 0.0}, {0.0, 0.0, 0.0}, {0.0, 0.0, 1.0}};
		int[][] temp = new int[inH+2][inW+2];
		
		for(int i=0; i<inH+2; i++) {
			for(int k=0; k<inW+2; k++) {
				temp[i][k] = 127;
			}
		}
		for(int i=0; i<inH; i++) {
			for(int k=0; k<inW; k++) {
				temp[i+1][k+1] = inImage[i][k];
			}
		}
		for(int i=0; i<outH; i++) {
			for(int k=0; k<outW; k++) {
				double S = 0.0;
				for(int m=0; m<3; m++) {
					for(int n=0; n<3; n++) {
						S += mask[m][n]*temp[i+m][k+n];
					}
				}
				outImage[i][k] = (int)S + 127;
				if(outImage[i][k] > 255) {
					outImage[i][k] = 255;
				}
				if(outImage[i][k] < 0) {
					outImage[i][k] = 0;
				}
			}
		}
		break;
	case "9" : //����
		outH = inH;
		outW = inW;

		//�޸� �Ҵ�
		outImage = new int[outH][outW];

		//ȭ�ҿ���ó��
		double mask2[][] = {{1.0/9.0, 1.0/9.0, 1.0/9.0},
						{1.0/9.0, 1.0/9.0, 1.0/9.0},
						{1.0/9.0, 1.0/9.0, 1.0/9.0}};
		//�ӽ� �Է� �迭 ����
		int [][] tempInImage2=new int[inH+2][inW+2];
		//�ӽ� �Է� �迭�� �Է� �迭 ������ �Է�
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				tempInImage2[i][k] = inImage[i][k];
			}
		}
		// �ӽ� ��� �迭 ����
		int[][] tempOutImage2=new int[outH][outW];

		// ����ó���˰���
		// ��¥ ����ó�� �˰���
		for(int i=0; i<inH; i++){
			for(int k=0; k<inW; k++){
				double S =0.0;
				for(int m=0; m<3; m++){
					for( int n=0; n<3; n++){
						S += mask2[m][n] * tempInImage2[i+m][k+n];
					}
				}
				tempOutImage2[i][k] = (int)S;
			}
		}

		//����ũ �հ� 0�϶� �߰������� �ٲ��ֱ�(�ʹ� ��ο��� �Ⱥ��ϼ� ������)
		for(int i=0; i<outH; i++)
			for(int k=0; k<outW; k++)
				if(tempOutImage2[i][k]<0)
					tempOutImage2[i][k] +=127;

		//�ӽ���¹迭���� ��¥ ��¹迭�� ����
		for(int i=0; i<outH; i++)
			for(int k=0; k<outW; k++){
				if(tempOutImage2[i][k]>255)
					tempOutImage2[i][k]=255;
				if(tempOutImage2[i][k]<0)
					tempOutImage2[i][k]=0;
				outImage[i][k] = tempOutImage2[i][k];
			}
		break;
	}
	
	// (4) ����� ���Ϸ� ����
	File outFp;
	FileOutputStream outFs;
	outFp = new File("C:/images/Out/" +outFile+ ".raw");
	outFs = new FileOutputStream(outFp.getPath());
	
	// �޸� --> ����
	for (int i=0; i<outH; i++) {
		for (int k=0; k<outW; k++) {
			outFs.write(outImage[i][k]);
		}
	}
	outFs.close();
	out.println("<h1><a href='http://localhost:8080/JSP_study/download.jsp?file="
			+outFile+"'>�ٿ�ε� </a></h1>");
	
%>
</body>
</html>