package com.kam.web.controller.parsing;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.kam.web.vo.ParsingVO;
import com.kam.web.vo.ProductVO;

@Controller
@RequestMapping("/parsing/")
public class ParsingController {

	@RequestMapping(value = "json_parsing")
//	@ResponseBody
	public ArrayList<ParsingVO> json_parsing(String page, Model model) {
		String clientId = "AKL0G73yaxxh4AXXpdDv"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "aorodgIl44"; // 애플리케이션 클라이언트 시크릿값"

		String text = null;
		try {
			text = URLEncoder.encode("coupang", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}
		System.out.println(page);
		int start = 1;
		if (!page.equals("")) {
			start = 1 + (Integer.parseInt(page) * 20);
		}
		String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text + "&display=20&start=" + start; // json
																													// 결과
//        String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);

		ArrayList<ParsingVO> list = new ArrayList<>();
		try {
			JSONParser jsonParse = new JSONParser();
			Object obj = jsonParse.parse(responseBody);
			JSONObject jsonObj = (JSONObject) obj;
			JSONArray array = (JSONArray) jsonObj.get("items");
			for (int i = 0; i < array.size(); i++) {
				System.out.println("======== items : " + i + " ========");
				JSONObject personObject = (JSONObject) array.get(i);
				System.out.println(personObject.get("title"));
				System.out.println(personObject.get("link"));
				ParsingVO pb = new ParsingVO();
				pb.setNo(i);
				pb.setTitle(personObject.get("title").toString().replaceAll("'", "&quot;"));
				pb.setContent(personObject.get("description").toString().replaceAll("'", "&quot;"));
				pb.setName(personObject.get("bloggername").toString().replaceAll("'", "&quot;"));
				pb.setLink(personObject.get("link").toString().replaceAll("'", "&quot;"));
				pb.setDate(personObject.get("postdate").toString().replaceAll("'", "&quot;"));
				list.add(pb);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("listParsing", list);
		model.addAttribute("page", page);
		return list;
	}

	@RequestMapping(value = "xml_parsing")
//	@ResponseBody
	public ArrayList<ParsingVO> xml_parsing(String page, Model model) {
		String clientId = "AKL0G73yaxxh4AXXpdDv"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "aorodgIl44"; // 애플리케이션 클라이언트 시크릿값"

		String text = null;
		try {
			text = URLEncoder.encode("쿠팡", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		int start = 1;
		if (!page.equals("")) {
			start = 1 + (Integer.parseInt(page) * 20);
		}else {
			page = "0";
		}
//        String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // json 결과
		String apiURL = "https://openapi.naver.com/v1/search/news.xml?query=" + text + "&display=20&start=" + start; // xml
																														// 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);
		System.out.println(responseBody);
		ArrayList<ParsingVO> list = new ArrayList<>();
		InputStream is = new ByteArrayInputStream(responseBody.getBytes());
		try {
			Document doc = parseXML(is);
			NodeList nl = doc.getElementsByTagName("item");
			for (int i = 0; i < nl.getLength(); i++) {
				Node node = (Node) nl.item(i);
				Element el = (Element) node;
				ParsingVO pb = new ParsingVO();
				System.out.println("제목 : " + getTagValue("title", el));
				System.out.println("내용 : " + getTagValue("description", el));
				pb.setNo(i);
				pb.setTitle(getTagValue("title", el).replaceAll("'", "&quot;").replaceAll("<b>", "<span style=color:red>").replaceAll("</b>", "</span>"));
				pb.setContent(getTagValue("description", el).replaceAll("'", "&quot;").replaceAll("<b>", "<span style=color:red>").replaceAll("</b>", "</span>"));
				/* pb.setName(getTagValue("bloggername", el).replaceAll("'","&quot;")); */
				pb.setLink(getTagValue("link", el));
				pb.setDate(getTagValue("pubDate", el));
				list.add(pb);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("listParsing", list);
		model.addAttribute("page", page);
		return list;
	}
	
	@RequestMapping(value = "xml_11st_parsing")
	public ArrayList<ProductVO> xml_11st_parsing(String page, Model model) throws ParserConfigurationException, SAXException, IOException {
		String text = null;
		try {
			text = URLEncoder.encode("바지", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		if (page.equals("")) {
			page = "0";
		}
		
		String url = "https://openapi.11st.co.kr/openapi/OpenApiService.tmall?key=54d361b6792904635d8f2f63ce566438&apiCode=ProductSearch&keyword=" + text + "&pageSize=20&pageNum=" + page;
		
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
																														// 결과

		ArrayList<ProductVO> list = new ArrayList<>();
		try {
			NodeList nl = doc.getElementsByTagName("Product");
			for (int i = 0; i < nl.getLength(); i++) {
				Node node = (Node) nl.item(i);
				Element el = (Element) node;
				ProductVO product = new ProductVO();
				System.out.println("제목 : " + getTagValue("ProductName", el));
				System.out.println("가격 : " + getTagValue("SalePrice", el));
				product.setpNo(i);
				product.setpName(getTagValue("ProductName", el).replaceAll("'", "&quot;").replaceAll("<b>", "<span style=color:red>").replaceAll("</b>", "</span>"));
				product.setpPrice(Integer.parseInt(getTagValue("SalePrice", el)));
				product.setpImgName(getTagValue("ProductCode", el));
				product.setpImgUrl(getTagValue("ProductImage300", el));
				list.add(product);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("productList", list);
		model.addAttribute("page", page);
		return list;
	}
	
	@RequestMapping("detail_xml_11st_parsing")	
	public ProductVO detail_xml_11st_parsing(Model model,String pNo) throws ClassNotFoundException, SQLException, ParserConfigurationException, SAXException, IOException {
		String url = "https://openapi.11st.co.kr/openapi/OpenApiService.tmall?key=54d361b6792904635d8f2f63ce566438&apiCode=ProductSearch&keyword=" + pNo;
		
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
																														// 결과

		NodeList nl = doc.getElementsByTagName("Product");
		ProductVO product = null;
		for (int i = 0; i < nl.getLength(); i++) {
			Node node = (Node) nl.item(i);
			Element el = (Element) node;
			product = new ProductVO();
			System.out.println("제목 : " + getTagValue("ProductName", el));
			System.out.println("가격 : " + getTagValue("SalePrice", el));
			product.setpNo(i);
			product.setpName(getTagValue("ProductName", el).replaceAll("'", "&quot;").replaceAll("<b>", "<span style=color:red>").replaceAll("</b>", "</span>"));
			product.setpPrice(Integer.parseInt(getTagValue("SalePrice", el)));
			product.setpImgName(getTagValue("ProductCode", el));
			product.setpImgUrl(getTagValue("ProductImage300", el));
			product.setpCompany(getTagValue("SellerNick", el));
			product.setpQuantity(Integer.parseInt(getTagValue("BuySatisfy", el)));
		}

		model.addAttribute("product", product);
		return product;
	}

	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlist = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlist.item(0);
		if (nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	private static Document parseXML(InputStream stream) throws Exception {

		DocumentBuilderFactory objDocumentBuilderFactory = null;
		DocumentBuilder objDocumentBuilder = null;
		Document doc = null;

		try {

			objDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
			objDocumentBuilder = objDocumentBuilderFactory.newDocumentBuilder();

			doc = objDocumentBuilder.parse(stream);

		} catch (Exception ex) {
			throw ex;
		}

		return doc;
	}

}
