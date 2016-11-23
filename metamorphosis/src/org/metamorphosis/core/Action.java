package org.metamorphosis.core;

import java.util.ArrayList;
import java.util.List;

public class Action {

	private String name;
	private String className="";
	private String method="execute";
	private String script;
	private List<Result> results = new ArrayList<Result>();
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getScript() {
		return script;
	}
	public void setScript(String script) {
		this.script = script;
	}
	public void addResult(Result result) {
		results.add(result);
	}
	public List<Result> getResults() {
		return results;
	}
	public void setResults(List<Result> results) {
		this.results = results;
	}
}
